////
////  Searchable.swift
////  SwiftUI-Study
////
////  Created by sueun kim on 4/28/24.
////
//
//import SwiftUI
//import Alamofire
//
//class ViewModel: ObservableObject{
//    @Published var followers: [String] = []
//    let url: URL = URL(string: "https://github.com/sueunal?tab=followers")!
//    func getFollowers(){
//        AF.request(url,method: .get){ result in
//            print(result.description)
//        }
//    }
//}
//struct Searchable: View {
//    @ObservedObject var viewModel = ViewModel()
//    var body: some View {
//        VStack{
//            Text("hello")
//                .task {
//                    await getFollowers()
//                }
//        }
//    }
//    
//    func getFollowers() async{
//        let url: URL = URL(string: "https://github.com/sueunal?tab=followers")!
//        let (data, _) = try! await URLSession.shared.data(from: url)
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        print(data)
//    }
//}
//
//#Preview {
//    Searchable()
//}
