//
//  DataController.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 16/11/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreModels")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)" )
            }
            
        }
    }
}
