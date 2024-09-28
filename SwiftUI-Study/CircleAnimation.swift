//
//  CircleAnimation.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 4/28/24.
//

import SwiftUI

struct CircleAnimation: View {
    @State var delays: [Double] = [0.0,0.1,0.2,0.3,0.4,0.5]
    @State var animate: Bool = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            HStack{
                ForEach(delays.indices,id: \.self){ index in
                    Rectangle()
                        .frame(width: 10,height: self.animate ? 120 : 20)
                        .foregroundColor(.green.opacity(0.8))
                        .animation(.spring.delay(self.delays[index]),value:self.animate)
                }
            }
            .onAppear{
               startAnimation()
            }
        }
    }
    func startAnimation(){
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
            self.animate.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7){
                self.animate.toggle()
            }
        }
    }
}

#Preview {
    CircleAnimation()
}
