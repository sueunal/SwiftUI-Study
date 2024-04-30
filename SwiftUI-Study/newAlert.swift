//
//  newAlert.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 4/30/24.
//

import SwiftUI

struct newAlert: View {
    @State private var isShowAlertStatus: Bool = false
    var body: some View {
        VStack{
            Button("Click to Change Alert Status!"){
               isShowAlertStatus = true
            }
            .alert("Network Error Message", isPresented: $isShowAlertStatus) {
                Button("OK") {
                    print("OK")
                }
                Button("Cancell") {
                }
            } message: {
                Image(systemName: "bolt")
                Text("This is an Error check your wi-fi or celuler..")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    newAlert()
}
