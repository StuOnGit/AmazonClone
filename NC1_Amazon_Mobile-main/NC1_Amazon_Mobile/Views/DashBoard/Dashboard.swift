//
//  Dashboard.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 16/11/22.
//

import SwiftUI

struct Dashboard: View {
    
    var items : [AmazonSeleableItem]
    
    let gridLayout2Column = [
        GridItem(.adaptive(minimum: 300, maximum: 500)),
        GridItem(.adaptive(minimum: 300, maximum: 500))
        
    ]
    let gridLayout = [
        GridItem(.adaptive(minimum: 300, maximum: 500))
    ]
    
    var body: some View {
        NavigationStack(){
            ScrollView{
                VStack{
                    MainScreenView(items: items)
                        .background(.white)
                    OffertView(items: items)
                        .background(CustomColors.background)

                    TopOffertView(item: items[2])
                        .background(.white)
                    BestSellerWomenView(items: items)
                        .background(.white)
                    SuggestedOffertsView(items: items)
                        .background(.white)
                    ExploreMoreView(items: items)
                        .background(.white)
                    BestSellerMenView(items: items)
                        .background(.white)
                    CreateAlertView(items : items)
                        .background(.white)
                }  .background(CustomColors.background)
            }
            .padding(.bottom, 10)
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.automatic)
        }
            
    }
        
}
    


struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(items: AmazonItemsDBAmazon)
    }
}
