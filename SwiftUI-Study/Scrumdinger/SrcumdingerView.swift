//
//  SrcumdingerView.swift
//  SwiftUI-Study
//
//  Created by Soom on 10/6/24.
//

import SwiftUI

struct SrcumdingerView: View {
    @State private var value: Double = 30.0
    var body: some View {
        VStack {
            ProgressView(value: value , total: 100)
            HStack {
                VStack (alignment: .leading) {
                    Text("Seconds Elapsed")
                    Label("300",systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack (alignment: .trailing) {
                    Text("Seconds Remaining")
                    Label("600",systemImage: "hourglass.bottom.half.fill")
                }
            }
            // Hstack 내부의 레이블의 대한 접근성을 무시함
            // .accessibility 는 Voice Over 와 같은 보조기능 설정에 관한 뷰 수정자
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time reamining")
            .accessibilityValue("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
            }
            .accessibilityLabel("Next speaker")
        }
        .padding()
    }
}

#Preview {
    SrcumdingerView()
}
