//
//  AmazonSeleableItem.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 19/11/22.
//

import Foundation

class AmazonSeleableItem : Identifiable, Codable,Hashable{
    static func == (lhs: AmazonSeleableItem, rhs: AmazonSeleableItem) -> Bool {
        return (lhs.id == rhs.id)
    }
    
    public func hash(into hasher: inout Hasher) {
          hasher.combine(id)
     }
    init(name : String, description : String, price : Float, images : [String]){
        self.name = name
        self.description = description
        self.price = price
        self.images = images
    }
    
    init(name : String, description : String, price : Float, images : [String], features : [String : String]){
        self.name = name
        self.description = description
        self.price = price
        self.images = images
        self.features = features
    }
    
    
    var id = UUID()
    private var name : String
   // private var category : CustomCategory // se si ha tempo
    private var description : String
    private var features : [String : String] = [:]
    private var price : Float
    private var images : [String] = []
    
    
    public func getDescription() -> String {
        return self.description
    }
    public func getStrAssetImages() -> [String] {
        return self.images
    }
    public func getName() -> String {
        return self.name
    }
    public func getPrice() -> Float {
        return self.price
    }
    public func getDetails() -> [String:String] {
        return self.features
    }
}
