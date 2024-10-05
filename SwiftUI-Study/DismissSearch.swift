//
//  DismissSearch.swift
//  SwiftUI-Study
//
//  Created by Soom on 9/14/24.
//

import SwiftUI

struct DismissSearch: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            SearchedView(searchText: searchText)
                .searchable(text: $searchText)
        }
    }
}

private struct SearchedView: View {
    let searchText: String
    let items = ["a","b","c"]
    var filterdItems: [String]  {
        items.filter{ $0 == searchText.lowercased() }
    }
    @State private var isPresented = false
    @Environment(\.dismissSearch) private var dismissSearch
    var body: some View {
        if let item = filterdItems.first{
            Button("Details about \(item)"){
                isPresented = true
            }
            .sheet(isPresented: $isPresented){
                NavigationStack{
                    DetailView(item: item, dismissSearch: dismissSearch)
                }
            }
        }
    }
}
private struct DetailView: View {
    var item: String
    var dismissSearch: DismissSearchAction
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Text("Information about \(item).")
            .toolbar {
                Button("Add") {
                    // Store the item here...
                    
                    
                    dismiss()
                    dismissSearch()
                }
            }
    }
}

#Preview {
    DismissSearch()
}
