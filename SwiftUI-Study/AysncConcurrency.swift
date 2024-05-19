//
//  AysncConcurrency.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 5/19/24.
//

import SwiftUI

struct AysncConcurrency: View {
    var body: some View {
        VStack{
            HStack{
                Text("")
                Text("")
                Text("")
                Text("")
                Text("")
            }
            Button{
                Concurrency()
            }label: {
                Text("Concurrency Test")
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.cyan.gradient)
                    )
            }
        }
    }
    func Concurrency(){
        DispatchQueue.global().async {
            print("task1")
        }
        DispatchQueue.global().async {
            print("task2")
        }
        DispatchQueue.global().async {
            print("task3")
        }
    }
}

#Preview {
    AysncConcurrency()
}
