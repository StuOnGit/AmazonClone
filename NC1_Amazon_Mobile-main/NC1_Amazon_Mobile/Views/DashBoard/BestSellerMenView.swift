//
//  BestSellerMenView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 17/11/22.
//

import SwiftUI

struct BestSellerMenView: View {
    
    let max_images : Int = 4
    var items : [AmazonSeleableItem]
    let gridLayout2Column = [
        GridItem(.adaptive(minimum: 300, maximum: 500)),
        GridItem(.adaptive(minimum: 300, maximum: 500))
    ]
    
    var body: some View {
        
        VStack{
            HStack{
                Text("Best seller for men from our brands")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding()
            
            
            LazyVGrid (columns: gridLayout2Column, alignment: .center, spacing: 20){
                
                ForEach(0..<max_images, id: \.self){ index in
                    Image(items[index].getStrAssetImages().first ?? "Uknown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    
                   
                }
            }
          
          
        }
    }
}

struct BestSellerMenView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerMenView(items: AmazonItemsDBAmazon)
    }
}
