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
    let rows = Array(repeating: GridItem(.fixed(100)), count: 3)
    let number = Array(repeating: 1, count: 10)
    @State var animationValues: Int = 100
    @State private var selectedColor: Color? = nil
    let name: [String] = Array(repeating: "John", count: 9)
    var body: some View {
        ZStack(alignment: .center){
            VStack(alignment: .leading){
                Section{
                    Text("Selected Color is \(selectedColor ?? .blue )")
                        .font(.title)
                        .padding(.leading,16)
                }
                LazyVGrid(columns:rows,spacing: 10){
                    ForEach(colorItem,id: \.self){ item in
                        VStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(item.gradient)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .onTapGesture {
                                    withAnimation{
                                        selectedColor = item
                                    }
                                }
                            Text("\(name[0])")
                        }
                    }
                }
            }
            if let selectedColor = selectedColor{
                isShowingColor(selectedColor)
                    .transition(.move(edge: .bottom))
            }
            if selectedColor != nil{
            }
        }
    }
    @ViewBuilder
    func isShowingColor(_ tabColor: Color) -> some View{
        Text("\(tabColor.description)")
            .foregroundStyle(.white)
            .fontDesign(.serif)
            .font(.largeTitle)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(tabColor.gradient.opacity(0.5))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
            )
            .padding(.horizontal,16)
    }
}
struct testView: View {
    var body: some View {
        VGrid()
    }
}
#Preview {
    testView()
}
