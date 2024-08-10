//
//  SceneStorageView.swift
//  SwiftUI-Study
//
//  Created by Soom on 8/10/24.
//

import SwiftUI

struct SceneStorageView: View {
    @SceneStorage("nickname") private var nicknameText: String = ""
    @SceneStorage("id")  var idText: String = ""
    @SceneStorage("pw") private var pwText: String = ""
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Text("회원가입")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .padding(.top,50)
                Spacer()
                TextField(text: $nicknameText) {
                    Text("닉네임 입력")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.brown)
                )
                TextField(text: $idText) {
                    Text("아이디 입력")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.brown)
                )
                TextField(text: $pwText) {
                    Text("비밀번호 입력 입력")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.brown)
                )
                Spacer()
                NavigationLink{
                    HomeView()
                }label: {
                    Text("회원가입")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.brown.gradient)
                        )
                }
            }
            .padding(.horizontal,10)
        }
    }
}


struct HomeView: View {
    @SceneStorage("id") var id: String = ""
    var body: some View {
        VStack{
            Text(id)
                .font(.largeTitle)
        }
    }
}
#Preview {
    SceneStorageView()
}
