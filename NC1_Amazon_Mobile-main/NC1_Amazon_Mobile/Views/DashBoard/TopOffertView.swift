//
//  TopOffertView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 17/11/22.
//

import SwiftUI

struct TopOffertView: View {
    
    var item : AmazonSeleableItem
    var body: some View {
        VStack{
            HStack{
                Text("Top offert")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding()
            
            Image(item.getStrAssetImages().first ?? "Unkown")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            HStack{
                Text("61% discount")
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                    .padding(4)
                    .background{
                        RoundedRectangle(cornerRadius: 3)
                            .foregroundColor(Color.red)
                        
                    }
                Text("Offert")
                    .foregroundColor(Color.red)
                    .bold()
                Spacer()
            }.padding()
        }
    }
}

struct TopOffertView_Previews: PreviewProvider {
    static var previews: some View {
        TopOffertView(item: AmazonSeleableItem(name: "2021 Apple MacBook Pro (14-inch, Apple M1 Pro chip with 8‑core CPU and 14‑core GPU, 16GB RAM, 512GB SSD) - Space Grey", description: " Apple M1 Pro or M1 Max chip for a massive leap in CPU, GPU and machine learning performance. Up to 10-core CPU delivers up to 3.7x faster performance to fly through pro workflows quicker than ever. Up to 32-core GPU with up to 13x faster performance for graphics-intensive apps and games. 16-core Neural Engine for up to 11x faster machine learning performance. Longer battery life, up to 17 hours. Up to 64GB of unified memory so everything you do is fast and fluid. Up to 8TB of superfast SSD storage launches apps and opens files in an instant. Stunning 14-inch Liquid Retina XDR display with extreme dynamic range and contrast ratio. 1080p FaceTime HD camera with advanced image signal processor for sharper video calls. Six-speaker sound system with force-cancelling woofers", price: 2069.00, images: ["macbook1","macbook2","macbook3"], features: ["Brand":"Apple", "Model name": "MacBook Pro", "Screen size": "14 Inches", "Colour": "Space Gray", "CPU model ": " A Series", "RAM memory installed size ": "16 GB", "CPU speed ": "3.1 GHz"]))
    }
}
