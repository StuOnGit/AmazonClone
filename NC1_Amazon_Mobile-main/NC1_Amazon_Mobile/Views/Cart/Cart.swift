//
//  Cart.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 15/11/22.
//


//TODO: Update the price

import SwiftUI
import SpriteKit


struct Refresh {
    
    var startOffset : CGFloat = 0.0
    var offset : CGFloat = 0.0
    var started : Bool
    var released : Bool
}

struct Cart: View {
    @Binding var itemsList : [AmazonSeleableItem]
    var totalPrice : Float {
        if (itemsList.isEmpty){
            return 0.0
        }else {
            return round(itemsList.map({$0.getPrice()}).reduce(0.0, +) * 100) / 100.0
        }
    }
    @Environment(\.dismiss) var dismiss
    @State var isOrdering = false
    @State var isGift = false
    @State var refresh = Refresh(started: false, released: false)
//
//    init(itemsList: Binding<[AmazonSeleableItem]>){
//        self.itemsList = itemsList
//        totalPrice = itemsList.map({$0.getPrice()}).reduce(0.0, +)
//    }
    
    var scene : ShipperScene{
       let scene = ShipperScene(size: CGSize(width: 116, height: 116))
        scene.scaleMode = .fill
       return scene
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                GeometryReader{ reader -> AnyView in
                    
                    DispatchQueue.main.async{
                        if (refresh.startOffset.isEqual(to: CGFloat(0.0))){
                            refresh.startOffset = reader.frame(in: .global).minY
                        }
                      
                        refresh.offset = reader.frame(in: .global).minY
                     
                      
                        if(refresh.offset - refresh.startOffset > 80 && !refresh.started){
                            refresh.started = true
                        }
                        
                        if(refresh.startOffset == refresh.offset && refresh.started && !refresh.released){
                            
                            withAnimation(.linear){
                                refresh.released = true
                                updateData()
                            }
                           
                           
                        }
                    }
                    
                    return AnyView(Color.black.frame(width: 0, height: 0))
                }.frame(width: 0, height: 0)
                
                VStack(alignment: .leading){
                    
                    if(refresh.started){
    
                        withAnimation(Animation.easeIn) {
                            
                            VStack{
                                HStack(){
                                    Spacer()
                                    SpriteView(scene: self.scene)
                                        .frame(width: 70, height: 70)
                                        .ignoresSafeArea()
                                    
                                    Spacer()
                                }
                                Text("Loading...")
                                    .foregroundColor(.gray)
                            }
                           
                        }
                       
                    }
                   // totalPrice = itemsList.map({$0.getPrice()}).reduce(0.0, +)
                    Text("Total: " + String(totalPrice) + "€")
                        .font(.system(size: 32))
                        .font(.headline)
                        .bold()
                    Text("Free shipment")
                        .foregroundColor(.green)
                    Button {
                        isOrdering = true
                    } label: {
                        Text("Proceed to order")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                           
                    }
                    .alert("Proceed to order? Total price is " + String(totalPrice), isPresented: $isOrdering, actions: {
                       
                            //dismiss()
                            NavigationLink {
                                NavigationStack{
                                    Text("Implementation in the next Update! Stay tuned.").font(.largeTitle)
                                    Image("Prime_logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                        .navigationTitle("Payment")
                                }.padding()
                                   
                            }label: {
                                Text("Yes")
                            }

                        Button ("Cancel", role: .cancel) {
                            dismiss()
                        }
                    })
                   
                    
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.yellow)
                            .shadow(radius: 3)
                    }
                    
                    Toggle("Send this as a gift.", isOn: $isGift).toggleStyle(.switch)
                    Divider()
                    
                    CartList(itemList: $itemsList)
                    
                    Spacer()
                      
                }
                .padding()
                .toolbar(Visibility.automatic)
                .navigationTitle("Cart")
              
            }
          
        }
    }
    
    func updateData(){
        print("Updating...")
        //self.scene.endAnimation()
        //self.scene.isReleased = true
        DispatchQueue.main.asyncAfter(deadline: .now()+1.7) {
            withAnimation(.linear){
                refresh.started = false
                refresh.released = false
               // self.scene.isFinished = true
              
            }

        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        
        Cart(itemsList: .constant(AmazonItemsDBAmazon))
      
    }
}
