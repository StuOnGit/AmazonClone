//
//  OffertView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 17/11/22.
//

import SwiftUI

struct OffertView: View {
    let max_images = 5
    var items : [AmazonSeleableItem]
    let gridLayout = [
        GridItem(.adaptive(minimum: 300, maximum: 500)),
    ]
    
    var body: some View {
            ScrollView(.horizontal){
                LazyHGrid(rows: gridLayout){
                    ForEach(0..<max_images, id: \.self){index in
                        OffertElementCard(item: items[index])
                    }
                }
                .padding(.bottom, 10)
            }
    }
}

struct OffertView_Previews: PreviewProvider {
    static var previews: some View {
        OffertView(items: AmazonItemsDBAmazon)
    }
}
