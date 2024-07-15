//
//  GameScene.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 19/11/22.
//

import Foundation
import SpriteKit
import SwiftUI

class ShipperScene : SKScene{
    
    var shipper: SKSpriteNode!
        
    @State var isFinished = false
    @State var isReleased = false
    
    var lastUpdateTime : TimeInterval = 0
    var dt: TimeInterval = 0
    
    var shipperIdleTextures : [SKTexture] = []
    
    var shipperEndingTextures : [SKTexture] = []
    
    
    var shipperTexture : SKTexture!
    
        private var shipperAtlas: SKTextureAtlas {
            return SKTextureAtlas(named: "Amazon_shipper")
        }
        private func setupShipper() {
            
            shipperTexture = SKTexture(imageNamed: "Amazon_shipper1")
            
            shipper = SKSpriteNode(texture: shipperTexture, size: CGSize(width: 100, height: 150))
            shipper.position = CGPoint(x: frame.width * 0.1, y: frame.height/2)
            
            addChild(shipper)
        }
        
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        
        for i in 1...8{
           
            let texture_name = "Amazon_shipper\(i)"
            
            shipperIdleTextures.append(SKTexture(imageNamed: texture_name))
        }
        
        
        for i in 8...25 {
            let texture_name = "Amazon_shipper\(i)"
            shipperEndingTextures.append(SKTexture(imageNamed: texture_name))
        }
        
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
            backgroundColor = SKColor.white
            self.setupShipper()
            self.startIdleAnimation()
        }
        
    
    override func update(_ currentTime: TimeInterval) {
//        if(isFinished){
//            endAnimation()
//        }else if(isReleased && !isFinished){
//            startIdleAnimation()
//        }
        if lastUpdateTime > 0{
            dt = currentTime - lastUpdateTime
        }else{
            dt = 0
        }
        lastUpdateTime = currentTime
        moveSprite(sprite: shipper, velocity: CGPoint(x:30, y: 0))
    }
    
    func moveSprite(sprite : SKSpriteNode, velocity: CGPoint){
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt), y: velocity.y * CGFloat(dt))
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
    }
    
    func startIdleAnimation() {
       
        let idleAnimation = SKAction.animate(with: shipperIdleTextures, timePerFrame: 0.1)

        shipper.run(SKAction.repeatForever(idleAnimation), withKey: "playerIdleAnimation")
     
    }
    
    func endAnimation() {
        
        let endingAnimation = SKAction.animate(with: shipperEndingTextures, timePerFrame: 0.1)
        
        shipper.removeAction(forKey: "playerIdleAnimation")
        
        shipper.run(SKAction.repeat(endingAnimation, count: 1))
        
    }
    
}
