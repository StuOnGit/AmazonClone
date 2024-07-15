//
//  ExploreMoreView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 17/11/22.
//

import SwiftUI

struct ExploreMoreView: View {
    let max_lines = 3
    var items : [AmazonSeleableItem]
    var body: some View {
        
        VStack{
            HStack{
                Text("Explore more")
                    .font(.title2)
                    .bold()
                Spacer()
            }.padding()
            ForEach(0..<max_lines, id: \.self){ index in
                HStack{
                    Image(items[index].getStrAssetImages().first ?? "Uknown")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading){
                        Text(
                            items[index].getName().count > 30 ?
                            String(items[index].getName().prefix(30) + "...") : items[index].getName())
                        Text(String(format: "%.2f", items[index].getPrice()) + "€")
                            .font(.system(size: 20)
                                .bold())
                    }
                    Spacer()
                    
                }
                
                
            }
        }
        
    }
}

struct ExploreMoreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreMoreView(items: AmazonItemsDBAmazon)
    }
}
