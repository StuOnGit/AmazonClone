//
//  SuggestedOffertsView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 17/11/22.
//

import SwiftUI

struct SuggestedOffertsView: View {
    let max_images = 4
    var items : [AmazonSeleableItem]
    let gridLayout2Column = [
        GridItem(.adaptive(minimum: 300, maximum: 500)),
        GridItem(.adaptive(minimum: 300, maximum: 500))
    ]
    
    
    var body: some View {
        VStack{
            HStack{
                Text("Suggested offerts for you")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding()
            
            LazyVGrid (columns: gridLayout2Column, alignment: .center, spacing: 20){
                
                ForEach(1..<max_images+1, id: \.self){ index in
                    VStack{
                        SuggestedElementView(item: items[index])
                    }
                }
            }
            
            
        }
    }
}

struct SuggestedOffertsView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedOffertsView(items: AmazonItemsDBAmazon)
    }
}
