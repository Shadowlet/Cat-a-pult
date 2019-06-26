//
//  BlockNode.swift
//  Cat-a-pult
//
//  Created by Zachary Carreiro on 2019-06-21.
//  Copyright © 2019 Team Cat. All rights reserved.
//

import Foundation
import SpriteKit



class BlockNode: SKSpriteNode, EventListenerNode {

    
    func didMoveToScene() {
        isUserInteractionEnabled = true
        print("block node works")
    }
    
//    func interact() {
//        isUserInteractionEnabled = false
//        
//        // Run when blocks get touched
////        run(SKAction.sequence([
////            SKAction.scale(to: 0.8, duration: 0.1),
////            SKAction.removeFromParent()
////            ]))
//    }
    
    
    
    
}
