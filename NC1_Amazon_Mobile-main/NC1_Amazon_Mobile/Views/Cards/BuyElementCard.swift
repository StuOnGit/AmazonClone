//
//  BuyElementCard.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 16/11/22.
//

import SwiftUI

struct BuyElementCard: View {
    var body: some View {
        

            HStack(alignment: .top){
            
                    Image("icecat")
                        .resizable()
                        .padding()
                        .frame(width: 140, height: 140)
                        .background{
                            Rectangle()
                                .frame(height: 180)
                                .cornerRadius(8) // vedi come risolvere
                                .foregroundColor(Color(red: 0.8, green: 1, blue: 1))
                        }
                
                VStack(alignment: .leading){
                    Text("Title")
                        .font(.system(size: 25))
                    Text("Rating")
                    Text("Price $")
                        .bold()
                        .font(.system(size: 20))
                    
                    HStack{
                        Text("Attribute 1:")
                            .bold()
                        Text("Attribute") //max 12 char
                    }
                    HStack{
                        Text("Attribute 2:")
                            .bold()
                        Text("Attribute") //max 12 char
                    }
                }
                
                Spacer()
            }
            .frame(height: 180)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 0.3)
                    
            }
            
            .padding(.bottom, 5)
            .padding(.top, 5)
            .padding(.trailing, 10)
            .padding(.leading, 10)
            
        
    }
}

struct BuyElementCard_Previews: PreviewProvider {
    static var previews: some View {
        BuyElementCard()
    }
}
