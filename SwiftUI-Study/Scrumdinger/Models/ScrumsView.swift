//
//  ScrumsView.swift
//  SwiftUI-Study
//
//  Created by Soom on 10/6/24.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum] = DailyScrum.sampleData
    var body: some View {
        List(scrums) { scrum in
            CardView(scrum: scrum)
                .listRowBackground(
                    scrum.theme.mainColor.opacity(0.75)
                )
        }
    }
}

#Preview {
    ScrumsView()
}
