//
//  SafeAreaColor.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 5/15/24.
//

import SwiftUI

struct SafeAreaColor: View {
    var body: some View {
        ZStack {
            // 전체 화면을 색칠하는 배경
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                // Safe Area의 크기와 위치를 가져옵니다.
                let safeAreaInsets = geometry.safeAreaInsets
                let safeAreaWidth = geometry.size.width
                let safeAreaHeight = geometry.size.height - safeAreaInsets.top - safeAreaInsets.bottom
                
                // Safe Area만 색칠하는 사각형
                Color.green
                    .frame(width: safeAreaWidth, height: safeAreaHeight)
                    .position(x: safeAreaWidth / 2, y: safeAreaHeight / 2 + safeAreaInsets.top)
                VStack{
                   Rectangle()
                }
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

#Preview {
    SafeAreaColor()
}
