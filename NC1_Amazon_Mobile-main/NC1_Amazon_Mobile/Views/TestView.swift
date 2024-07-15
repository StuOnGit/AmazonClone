//
//  TestView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 19/11/22.
//

import SwiftUI
import SpriteKit

struct TestView: View {
    
    var scene : SKScene{
       let scene = GameScene()
       scene.size = CGSize(width: 216, height: 216)
       scene.scaleMode = .fill
       return scene
    }
    
    var body: some View {
        SpriteView(scene: self.scene)
                   .frame(width: 200, height: 200)
                   .ignoresSafeArea()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
