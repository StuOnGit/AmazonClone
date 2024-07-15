//
//  ItemDetail.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 22/11/22.
//

import SwiftUI


//TODO: go back when he press on add to cart

struct ItemDetail: View {
    @Environment(\.dismiss) var dismiss
    @State var isAdded = false
    @Binding var item : AmazonSeleableItem
    let gridLayout2Column = [
        GridItem(.adaptive(minimum: 300, maximum: 500), alignment: .topLeading),
        GridItem(.adaptive(minimum: 300, maximum: 500))
    ]
    @Binding var itemsList : [AmazonSeleableItem]
    @Binding var tabSelection : Int
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(spacing: 5){
                    VStack{
                        HStack{
                            Text(item.getName())
                                .font(.footnote)
                            Spacer()
                        }
                        .padding()
                       
                        TabView {
                            ForEach(item.getStrAssetImages(), id: \.self){ image in
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                  
                                    
                            }
                            
                        }.tabViewStyle(.page(indexDisplayMode: .always))
                            .frame( height: 300)
                            .border(Color.gray, width: 0.2)
                        
                    }.background(.white)
                    HStack{
                        
                    }
                    VStack(spacing: 10){
                        HStack{
                            
                            Text(String(item.getPrice()) + "€")
                                .font(.title3)
                                .bold()
                            
                            Spacer()
                            
                        }
                        .padding()
                        
                        HStack{
                            Text("This item conform to FREE shipment")
                            Spacer()
                        }.padding(.leading,15)
                        
                        HStack{
                            Label{
                                Text("Send to Francesco - Portici 80055")
                            }icon: {
                                Image(systemName: "mappin.and.ellipse")
                                 
                            }
                            .foregroundColor(.blue)
                            Spacer()
                        }
                        .padding(.leading, 15)
                        
                        Button{
                          
                            
                            isAdded = true
                        }label: {
                            Text("Add to cart")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                            
                        }
                        .alert("Add \(item.getName()) to your cart?", isPresented: $isAdded, actions: {
                            Button("Cancel", role: .cancel){
                                dismiss()
                            }
                            Button("Yes"){
                                itemsList.append(item)
                                savePack("items", itemsList)
                                withAnimation {
                                    self.tabSelection = 1
                                }
                               
                            }
                        })
                       
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.yellow)
                                .shadow(radius: 3)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)
                        }
                    }
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    
                    
                    VStack(){
                        HStack{
                            Text("Details")
                                .font(.title3)
                                .bold()
                            Spacer()
                        }
                        LazyVGrid (columns: gridLayout2Column, alignment: .leading, spacing: 20){
                            ForEach(item.getDetails().sorted(by: >), id: \.key) { key, value in
                                Text(key)
                                Text(value)
                            }
                            
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    
                    VStack(spacing: 10){
                        HStack{
                            Text("Description")
                                .font(.title3)
                                .bold()
                            Spacer()
                        }
                        Text(item.getDescription())
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    
                    VStack(spacing: 10) {
                        HStack{
                            Text("Gallery Images product")
                                .font(.title3)
                                .bold()
                            Spacer()

                        }
                        ForEach(item.getStrAssetImages(), id: \.self){ image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    
                    VStack(spacing: 10){
                        HStack{
                            Text("More information")
                                .font(.title3)
                                .bold()
                            Spacer()

                        }
                        
                        
                        HStack{
                            Text("Shipment restiction")
                                .bold()
                            Spacer()
                        }
                        HStack{
                            Text("This article is available for export to European Union countries.")
                            Spacer()
                        }
                        
                        HStack{
                            Text("Legal guarantee, right of withdrawal and return policy")
                                 .bold()
                            Spacer()
                        }
                        Text("Warranty and returns: If you want to return a product within 30 days of receipt because you've changed your mind, consult our Returns Policy help page. If you have received a faulty or damaged product, consult our Legal Guarantee help page. For specific information on Marketplace purchases, see our Help page on Returns and Refunds for Marketplace Items.")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    
                    Spacer()
                }
                
                .background(CustomColors.background)
            }
        }
     
        

    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: .constant(AmazonItemsDBAmazon.first!), itemsList: .constant(AmazonItemsDBAmazon), tabSelection: .constant(1))
    }
}
