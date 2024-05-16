//
//  ExtensionColor.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 5/13/24.
//

import SwiftUI

struct ExtensionColor: View {
    var body: some View {
        ZStack{
            Color.myExtensoinColor.ignoresSafeArea()
            Text("This is myExtensionColor")
        }
    }
}
extension Color{
    static var myExtensoinColor = Color("myExtensionColor")
}

#Preview {
    ExtensionColor()
}
