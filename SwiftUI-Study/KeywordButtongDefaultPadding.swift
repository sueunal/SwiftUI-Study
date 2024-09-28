//
//  KeywordButtongDefaultPadding.swift
//  SwiftUI-Study
//
//  Created by Soom on 9/28/24.
//

import SwiftUI

struct KeywordButtongDefaultPadding: View {
    let keyword: String
    let symbol: String
    @ScaledMetric(relativeTo: .title) var paddingWidth = 14.5
    var body: some View {
        Label(keyword, systemImage: symbol)
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
            .padding(paddingWidth)
            .background(.purple.opacity(0.75), in: Capsule())
    }
}

#Preview {
    let keywords: [String] = ["SwiftsdfadsfasfUI", "Swift", "iOS", "macOS", "tvOS", "watchOS"]
    
    ForEach(keywords, id: \.self) { keyword in
        KeywordButtongDefaultPadding(keyword:keyword , symbol: "leaf")
    }
}
