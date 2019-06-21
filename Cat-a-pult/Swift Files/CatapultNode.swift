//
//  Catapult.swift
//  Cat-a-pult
//
//  Created by Zachary Carreiro on 2019-06-19.
//  Copyright © 2019 Team Cat. All rights reserved.
//

import SpriteKit

class CatapultNode: SKSpriteNode, EventListenerNode, InteractiveNode {
    
    var catapult: SKSpriteNode!
    var cat: SKSpriteNode!
    private var xFloat: CGFloat?
    private var yFloat: CGFloat?
    
    
    func didMoveToScene() {
        //let catapultBodyTexture = SKTexture(imageNamed: "catapult")
    }
    func interact() {
        isUserInteractionEnabled = false
    }
    
    func update(_ currentTime: TimeInterval) {
        
    }
    
    private func launchCat(cannonY: CGFloat) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    
}
