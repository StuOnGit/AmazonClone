//
//  Search.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 22/11/22.
//

import SwiftUI

struct Search: View {
    @State var amazonItems = AmazonItemsDBAmazon
    @State private var searchText = ""
    //@StateObject var searchOO = SearchObservableObject()
    
    @Binding var tabSelection : Int
    @Binding var itemsList : [AmazonSeleableItem]
   
    
    var searchResults: [AmazonSeleableItem] {
           if searchText.isEmpty {
               return []
           } else {
               return amazonItems.filter {$0.getName().localizedCaseInsensitiveContains(searchText)}
//               return AmazonItemsDBAmazon.map { $0.getName() }.filter { $0.getName().contains(searchText) }
           }
       }
    
    var body: some View {
        NavigationStack{
            
            
            VStack{
                if(searchResults.isEmpty){
                    Text("Find the best for you")
                        .font(.title.weight(.bold))
                    Text("Start searching to see if there are any offerts right now")
                        .multilineTextAlignment(.center)
                }else{
                    VStack(alignment: .leading, spacing: 20){
                        ForEach(searchResults){ result in
                            
                            let idx = amazonItems.firstIndex { $0.id == result.id}!
                            NavigationLink {
                                ItemDetail(item: $amazonItems[idx], itemsList: $itemsList, tabSelection: $tabSelection)
                            }label: {
                                Text(String(result.getName()))
                                    .multilineTextAlignment(.leading)
                            }
                           Divider()
                        }
                        Spacer()
                    }
                 
                }
              
                
                
               
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.gray)
            .navigationTitle("Search")
        }
        .searchable(text: $searchText) {
           
        }
//        .onChange(of: searchText){ searchText in
//            searchOO.searchResults = AmazonItemsDBAmazon.map { $0.getName() }.filter({ name in
//                name.lowercased().contains(searchText.lowercased())
//            })
//        }
    
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search(tabSelection: .constant(2), itemsList: .constant(AmazonItemsDBAmazon) )
    }
}
