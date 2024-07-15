//
//  Search.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 16/11/22.
//

import SwiftUI

struct Search: View {
    
    @State private var searchText = ""
    @StateObject var searchOO = SearchObservableObject()
    
    
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
   
    
    var searchResults: [String] {
           if searchText.isEmpty {
               return []
           } else {
               return names.filter { $0.contains(searchText) }
           }
       }
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Find the best for you")
                    .font(.title.weight(.bold))
                Text("Start searching to see if there are any offerts right now")
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.gray)
            .navigationTitle("Search")
            .toolbar {
                ToolbarItem{
                    Image(systemName: "square.grid.2x2")
                        .foregroundColor(CustomColors.accent)
                }
            }
        }
        .searchable(text: $searchText) {
            ForEach(searchOO.searchResults, id: \.self) { result in
                Text(String(result))
            }
        }
        .onChange(of: searchText){ searchText in
            searchOO.searchResults = names.filter({ name in
                name.lowercased().contains(searchText.lowercased())
            })
        }
    
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
