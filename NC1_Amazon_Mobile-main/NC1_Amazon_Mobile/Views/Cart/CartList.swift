//
//  CartList.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 16/11/22.
//

import SwiftUI




struct CartList: View {
    
    
    @Binding var itemList : [AmazonSeleableItem]
    @State var index : Int = 0
    @Environment(\.editMode) var editMode
    
    var body: some View {
        
        
        
        VStack{
            
                
            ForEach(0..<$itemList.count, id: \.self){ i in
                    HStack{
                        if editMode?.wrappedValue == .active {
                            Button(action: {index = i
                                deleteItem(numbr: index)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                        CartElementCard(item: $itemList[i])
                    }
                }
            //.onDelete(perform: self.deleteItem)
            
            //.navigationViewStyle(StackNavigationViewStyle())
        }
        .toolbar{
            EditButton()
        }
       // .navigationSplitViewStyle(StackNavigationViewStyle())
        
        
        
    }
    
    private func deleteItem(numbr: Int){
        withAnimation {
            self.itemList.remove(at: numbr)
            savePack("items", itemList)
        }
        
    }
}

struct CartList_Previews: PreviewProvider {
    static var previews: some View {
        CartList(itemList: .constant(AmazonItemsDBAmazon))
    }
}
