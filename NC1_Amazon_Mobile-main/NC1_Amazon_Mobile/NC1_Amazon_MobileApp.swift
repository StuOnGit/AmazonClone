//
//  NC1_Amazon_MobileApp.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 15/11/22.
//

import SwiftUI

@main
struct NC1_Amazon_MobileApp: App {
    
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
