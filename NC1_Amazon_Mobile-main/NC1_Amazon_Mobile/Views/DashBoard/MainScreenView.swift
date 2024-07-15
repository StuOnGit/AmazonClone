//
//  MainScreen.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 17/11/22.
//

import SwiftUI


struct MainScreenView: View {
    
    var items : [AmazonSeleableItem]
    @State var index = 0
    var body: some View {
        VStack(){
            
            
            
                
                TabView {
                    ForEach(items){ item in
                        Image(item.getStrAssetImages()[2])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                    }
                    
                }.tabViewStyle(.page(indexDisplayMode: .always))
                .frame( height: 300)
            
            
            
            
        }
        
    }
}


struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(items: AmazonItemsDBAmazon)
    }
}
