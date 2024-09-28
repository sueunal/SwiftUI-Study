//
//  ViewModifierExtension.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 5/15/24.
//

import SwiftUI

struct ViewModifierExtension: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.cyan)
                .customModifier()
                
            RoundedRectangle(cornerRadius: 10)
                .fill(.myExtension)
                .customModifier()
        }
    }
}
struct CustomModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .padding(.horizontal,16)
    }
}

struct RoundedCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
extension View{
    func customModifier()-> some View{
       modifier(CustomModifier())
    }
}
//extension Shape{
//    func roundedCouner()-> some Shape{
//        modifier(RoundedCorner(corners: .allCorners, radius: 10))
//    }
//}

#Preview {
    ViewModifierExtension()
}
