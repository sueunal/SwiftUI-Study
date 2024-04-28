//
//  Home.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 4/25/24.
//

import SwiftUI

struct Home: View {
    @State private var size: CGFloat = 0
    var body: some View {
        NavigationStack{
            VStack{
                RoundedRectangle(cornerRadius: 8)
                    .fill(.green.gradient.opacity(0.9))
                    .frame(height: size)
                    .shadow(radius: 1)
                    .padding(.horizontal,16)
                    .onAppear{
                        withAnimation(.bouncy){
                            size = 800
                        }
                    }
                    .onTapGesture {
                        withAnimation(.easeIn){
                            size = 0
                        }
                    }
                NavigationLink {
                    VGrid()
                } label: {
                    Text("touch")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    Home()
}
