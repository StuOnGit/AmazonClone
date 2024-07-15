//
//  ElementCard.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 16/11/22.
//

import SwiftUI

struct CartElementCard: View {
    @Binding
    var item: AmazonSeleableItem
    
    var body: some View {
        HStack(alignment: .top){
            Image(item.getStrAssetImages().first ?? "error")
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
                .padding()
                .frame(width: 170)
                
                
            VStack(alignment: .leading){
                Text(item.getName())
                    .font(.system(size: 25))
                Text(String(item.getPrice()) + "€")
                    .bold()
                    .font(.system(size: 20))
                Text("Immediate availability")
                    .foregroundColor(.green)
                HStack{
                    Text(item.getDetails().values.first ?? "error")
                        .font(.footnote)
                }
                   
                
                
                
//                HStack{
//                    Spacer()
//                    Button{
//                        //Save for later
//                    }label: {
//                        Text("Save for later")
//                            .foregroundColor(.black)
//                    }
//                    .padding(10)
//                    .background {
//                        RoundedRectangle(cornerRadius: 8)
//                            .frame(height: 30)
//                            .foregroundColor(CustomColors.mainColor)
//                    }
//                }

                
            }
            
            Spacer()
        }
        .frame(height: 140)
        .border(Color.gray, width: 0.2)
      
    }
}

struct CartElementCard_Previews: PreviewProvider {
    static var previews: some View {
        CartElementCard(item: .constant(AmazonItemsDBAmazon.first!))
    }
}
