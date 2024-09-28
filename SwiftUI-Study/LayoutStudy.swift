//
//  LayoutStudy.swift
//  SwiftUI-Study
//
//  Created by Soom on 8/7/24.
//

import SwiftUI

struct LayoutStudy: View {
    @State private var text: String = ""
    var body: some View {
//        GeometryReader{ proxy in
//            VStack{
//                Text("Hello World, how are you?")
//                    .font(.largeTitle)
//                    .frame(width: proxy.size.width / 2, height: (proxy.size.height / 4) * 3)
//                Text("Goodbye World")
//                    .font(.largeTitle)
//                    .frame(width: proxy.size.width / 2.5, height: (proxy.size.height / 4))
//            }
//        }
        VStack{
            Text("Hello World, how are you?")
            Text("Hello World, how are you?")
            CustomText()
            CustomText()
            CustomText()
            CustomText()
        }
    }
}

struct CustomText: View {
    @State private var text: String = ""
    var body: some View {
        VStack{
            TextField("여기에 텍스트 입력", text: $text)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                )
                .padding(.horizontal,10)
            Text("Custom Text")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                )
                .padding(.horizontal,10)
        }
    }
}
#Preview {
    LayoutStudy()
}
