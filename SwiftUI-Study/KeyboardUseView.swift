//
//  KeyboardUseView.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 5/16/24.
//

import SwiftUI

struct KeyboardUseView: View {
    @State private var message: String = ""
    var body: some View {
        VStack{
            Spacer()
            TextField(""
                      , text: $message
                      , prompt: Text("message input field")
                .font(.footnote)
                .foregroundStyle(.brown)
            )
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke()
                    .fill(.brown.gradient)
            )
            .padding(.horizontal,16)
            Spacer()
            Button{
                
            }label: {
                Text("Button")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.green)
                    )
                    .padding(.horizontal,16)
            }
        }
        .keyboardAdaptive()
    }
}

#Preview {
    KeyboardUseView()
}
