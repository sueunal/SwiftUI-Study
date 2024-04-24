//
//  VGrid.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 4/24/24.
//

import SwiftUI

struct VGrid: View {
    @State private var colorItem: [Color] = [.red,.green,.blue,.yellow,.purple,.brown,.indigo,.pink,.mint]
    let colums = [GridItem(.fixed(100)),GridItem(.fixed(100))]
    let rows = Array(repeating: GridItem(.fixed(50)), count: 3)
    var body: some View {
        LazyVGrid(columns:rows,spacing: 10){
            ForEach(colorItem,id: \.self){ item in
                RoundedRectangle(cornerRadius: 8)
                    .fill(item.gradient)
                    .frame(width: 100,height: 100)
            }
        }
    }
}

#Preview {
    VGrid()
}
