//
//  OffertElementCard.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 16/11/22.
//

import SwiftUI

struct OffertElementCard: View {
    var item : AmazonSeleableItem
    var body: some View {
        VStack(alignment: .leading){
            Text("Continue to buy")
                .font(.callout)
                .padding(.bottom, 20)
            Image(item.getStrAssetImages()[1])
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 100)
        }
        .padding(.top, 20)
        .padding(.bottom, 20)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
        }
    }
}

struct OffertElementCard_Previews: PreviewProvider {
    static var previews: some View {
        OffertElementCard(item: AmazonItemsDBAmazon.first!)
    }
}
