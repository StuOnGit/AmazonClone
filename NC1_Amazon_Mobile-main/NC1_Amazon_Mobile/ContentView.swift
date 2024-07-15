//
//  ContentView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 15/11/22.
//

import SwiftUI

struct ContentView: View {

    var amazonItems : [AmazonSeleableItem] = AmazonItemsDBAmazon
    @State var itemsList = itemsJSON
    @State var selection = 0
    var body: some View {
        
        TabView(selection: $selection) {
            Dashboard(items: amazonItems)
                .tabItem(){
                    Image(systemName: "house")
                    
                }.preferredColorScheme(.light)
                .tag(0)
            Cart(itemsList: $itemsList)
                .tabItem(){
                    Image(systemName: "cart")
                    
                }.preferredColorScheme(.light)
                .tag(1)
            Search(tabSelection: $selection, itemsList: $itemsList)
                .tabItem(){
                    Image(systemName: "magnifyingglass")
                }.preferredColorScheme(.light)
                .tag(2)
        }
        .accentColor(CustomColors.accent)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
