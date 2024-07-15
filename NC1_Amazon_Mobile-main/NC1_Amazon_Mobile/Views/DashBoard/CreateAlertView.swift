//
//  CreateAlertView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 17/11/22.
//

import SwiftUI

struct CreateAlertView: View {
    let max_images : Int = 4
    var items : [AmazonSeleableItem]
    let gridLayout2Column = [
        GridItem(.adaptive(minimum: 300, maximum: 500)),
        GridItem(.adaptive(minimum: 300, maximum: 500))
    ]
    var body: some View {
        
        VStack{
            HStack{
                Text("Get alerts about these offerts and other similar items")
                    .font(.title2)
                    .bold()
                Spacer()
            }.padding()
            
            
            
            LazyVGrid (columns: gridLayout2Column, alignment: .center, spacing: 20){
                
                ForEach(0..<max_images, id: \.self){ index in
                   
                    AlertElementView(item: items[index])
                    
                   
                }
            }
            
        
        }
    }
}

struct CreateAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAlertView(items: AmazonItemsDBAmazon)
    }
}
