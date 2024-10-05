//
//  AdjustingTheSpaceBetweenViews.swift
//  SwiftUI-Study
//
//  Created by Soom on 9/28/24.
//

import SwiftUI

enum TrainSymbol: String{
    case front = "train.side.front.car"
    case middle = "train.side.middle.car"
    case rear = "train.side.rear.car"
}
struct AdjustingTheSpaceBetweenViews: View {
    var body: some View {
        Text("Default Spacing")
        HStack (spacing: 0){
            TrainCar(.rear)
            TrainCar(.middle)
            TrainCar(.front)
        }
        TrainTrack()
    }
}
struct TrainCar: View {
    let position: TrainSymbol
    let showFrame: Bool
    init(_ position: TrainSymbol, showFrame: Bool = true) {
        self.position = position
        self.showFrame = showFrame
    }
    var body: some View {
        Image(systemName: position.rawValue)
            .background(Color.pink.opacity(0.4))
    }
}
struct TrainTrack: View {
    var body: some View {
        Divider()
            .frame(maxWidth: 200)
    }
}


#Preview {
    AdjustingTheSpaceBetweenViews()
}
