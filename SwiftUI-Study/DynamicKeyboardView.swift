//
//  KeyboardHandler.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 5/13/24.
//

import SwiftUI

struct DynamicKeyboardView: View {
    @State private var nickname: String = ""
    @State private var currentString: [String] = []
    var body: some View {
            VStack{
                Spacer()
                ForEach(currentString,id: \.self){ current in
                    Text(current)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.brown.opacity(0.5))
                        )
                }
                TextField("",text: $nickname, prompt: Text("여기에 입력해주세여!"))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray.opacity(0.5))
                    )
                Button{
                    currentString.append(nickname)
                }label: {
                    Text("버튼")
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.green.gradient)
                        )
                        .keyboardAdaptive()
                        .ignoresSafeArea(.keyboard,edges: .bottom)
                }
        }
        .padding(.horizontal,16)
    }
}

struct KeyboardHandler: ViewModifier {
    @ObservedObject private var keyboard = KeyboardResponder()
    func body(content: Content) -> some View {
        content
            .padding(.bottom, 16)
            .animation(.easeOut(duration: 0.16))
    }
}

extension View{
    func keyboardAdaptive()-> some View{
       modifier(KeyboardHandler())
    }
}

#Preview {
    DynamicKeyboardView()
}
