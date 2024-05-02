//
//  RECO.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 5/2/24.
//

import Foundation
import Alamofire
import CoreLocation
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ Manager: CLLocationManager, didUpdateLocations Locations: [CLLocation]) {
        location = manager.location?.coordinate
    }
    
}

struct Plans: Codable {
    let plans: [Plan]
}

// MARK: - Plan
struct Plan: Codable {
    let contents: [Content]
}

// MARK: - Content
struct Content: Codable {
    let images, description, id, name: String
    let rate, reviewCount: Int
    let tag: [String]
    let type: String

    enum CodingKeys: String, CodingKey {
        case images = "Images"
        case description, id, name, rate
        case reviewCount = "review_count"
        case tag, type
    }
}


class REGO: ObservableObject{
    @Published var plans: [Plan] = []
    let manager = CLLocationManager()
    let urlAIString: String = "http://regonowgist.iptime.org:5000"
    var currentLatitude: CLLocationDegrees?
    var currentLongitude: CLLocationDegrees?
    init(){
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        self.currentLatitude = manager.location?.coordinate.latitude
        self.currentLongitude = manager.location?.coordinate.longitude
    }

    func getLocation()->String{
        if let currentlati = currentLatitude,let currentlongiti = currentLongitude{
            let location: [Double] = [currentlongiti,currentlati]
            
            let latitudeString = String(format: "%.7f", abs(location.first!))
            let longitudeString = String(format: "%.7f",abs(location.last!))
            
            let positionString = "[" +  latitudeString + "," +  longitudeString + "]"
            return positionString
            
        }else{
            return ""
        }
    }
    func requestPlanRecommend(){
        let userLocation = getLocation()
        let parameter: Parameters? = [
            "position" : getLocation()
        ]
        let url = "\(urlAIString)/plan/recommend"
        AF.request(url,method: .get,parameters: parameter, interceptor: AuthManager()).responseDecodable(of: Plans.self){ response in
            switch response.result{
            case .success(let data):
                self.plans = data.plans
                print(data.plans)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
    }
}

final class AuthManager: RequestInterceptor{
    let retryLimit = 3
    let retryDelay: TimeInterval = 1
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.headers.add(.authorization(bearerToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxZjlmYjU2OS03NWY4LTRiZDctYWYyNy02ZDA5M2IzYTA3N2EiLCJwY29kZSI6MSwiaWF0IjoxNzE0MDI2NjkwLCJleHAiOjE3MTQwMjY2OTUsImlzcyI6InJlZ28ifQ"))
        completion(.success(urlRequest))
    }
    func intercept(_ request: URLRequest, response: HTTPURLResponse?, data: Data?, error: Error?, completion: @escaping (Result<Data, Error>) -> Void) {
        if let error = error {
            print("Error: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }
        
        if let data = data {
            print(data)
            completion(.success(data))
        } else {
            let emptyDataError = AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)
            print("Empty Data Error: \(emptyDataError.localizedDescription)")
            completion(.failure(emptyDataError))
        }
    }
}
