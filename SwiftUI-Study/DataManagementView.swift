//
//  DataManagementView.swift
//  SwiftUI-Study
//
//  Created by Soom on 9/28/24.
//

import SwiftUI



struct Event{
    let title: String
    let date: Date
    let locaiton: String
    let symbol: String
}
struct DataManagementView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EventTitle: View {
    let event: Event
    let stripeHeight = 15.0
    var body: some View {
        HStack(alignment: .lastTextBaseline){
            Image(systemName: event.symbol)
                .font(.title)
                .border(.black)
            VStack(alignment: .leading){
                Text(event.date, format: Date.FormatStyle().day().month(.wide))
                    .border(.black)
                Text(event.locaiton)
                    .border(.black)
            }
        }
        .padding()
        .padding(.top, stripeHeight)
        .background{
            ZStack(alignment: .top){
                Rectangle()
                    .opacity(0.3)
                Rectangle()
                    .frame(maxHeight: stripeHeight)
            }
            .foregroundStyle(.teal)
        }
        .clipShape(RoundedRectangle(cornerRadius: stripeHeight,style: .continuous))
        
    }
}
#Preview {
    let event = Event(title: "buy daisies", date: Date(), locaiton: "Flower Shop", symbol: "swift")
    EventTitle(event:  event)
}
