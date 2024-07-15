//
//  SuggestedElementView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 17/11/22.
//

import SwiftUI

struct SuggestedElementView: View {
    
    var item : AmazonSeleableItem
    var body: some View {
        VStack{
            Image(item.getStrAssetImages().first ?? "Unkown")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                
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

struct SuggestedElementView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedElementView(item: AmazonItemsDBAmazon.first!)
    }
}
