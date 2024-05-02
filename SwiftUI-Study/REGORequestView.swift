//
//  REGORequestView.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 5/2/24.
//

import SwiftUI

struct REGORequestView: View {
    @ObservedObject var viewModel = REGO()
    var body: some View {
        VStack{
            Text(viewModel.plans.description)
            Button{
                viewModel.requestPlanRecommend()
            }label: {
                Text("Request!!!")
            }
        }
    }
}

#Preview {
    REGORequestView()
}
