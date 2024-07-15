//
//  AlertElementView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 17/11/22.
//

import SwiftUI

struct AlertElementView: View {
    var item : AmazonSeleableItem
    @State
    var alertIsClicked = false
    
    var body: some View {
        VStack{
            Image(item.getStrAssetImages()[1])
                .resizable()
                .frame(width: 100, height: 100)
            if (alertIsClicked){
                Button("Delete alert"){
                    alertIsClicked = false
                }
                .font(.system(size: 14))
                .foregroundColor(Color.black)
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 3)
                        .foregroundColor(Color(red: 0.7, green: 0.7, blue: 1))
                }
                
            } else {
                Button("Create alert"){
                    alertIsClicked = true
                }
                .font(.system(size: 14))
                .foregroundColor(Color.black)
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 3)
                        .foregroundColor(Color.yellow)
                }
            }
        }
       
    }
}
struct AlertElementView_Previews: PreviewProvider {
    static var previews: some View {
        AlertElementView(item: AmazonItemsDBAmazon.first!)
    }
}
