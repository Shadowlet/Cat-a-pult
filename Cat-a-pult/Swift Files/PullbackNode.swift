//
//  Catapult.swift
//  Cat-a-pult
//
//  Created by Zachary Carreiro on 2019-06-19.
//  Copyright © 2019 Team Cat. All rights reserved.
//

import SpriteKit

class PullbackNode: SKSpriteNode, EventListenerNode, InteractiveNode {
    
    
    var catNode: PullbackNode!
    var cat: SKSpriteNode!
    private var xFloat: CGFloat?
    private var yFloat: CGFloat?

    var elapsedTime: Int = 0
    var startTime: Int?
    var isHoldingScreen = false
    
    
    func didMoveToScene() {
        isUserInteractionEnabled = true
        
    }
    func interact() {
        isUserInteractionEnabled = false
        
    }
    
    
    func update(_ currentTime: TimeInterval) {
//        if self.isHoldingScreen != false {
//            //print("true")
//            rotateSprite()
//            updateTimer(currentTime: currentTime)
//        }
        
       // print(self.zRotation)
//        if self.zRotation * 180 / π >= 180.0 {
//
//            print("AAAAAAAAAAAAAAAAAAAAAAAAAAA")
//            self.zRotation = currentRotation
//        }
//
//        if (self.isHoldingScreen) {
//            print("is holding screen!")
//        }
    }
    
    func updateTimer(currentTime: TimeInterval) {
        // 1
        if let startTime = startTime {
            // 2
            
            elapsedTime = Int(currentTime) - startTime
        } else {
            // 3
            startTime = Int(currentTime) - elapsedTime
        }
    }
    
    
    
    private func launchCat(cannonY: CGFloat) {
        
    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        print(self)
//
//        //print("screen untouched")
//        //print(elapsedTime)
//        if self.isHoldingScreen != false {
//            print("hi")
//        }
//        self.isHoldingScreen = false
//        elapsedTime = 0
//    }
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        holdScreen()
//    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //holdScreen()
//        print(self)
//        
//        
//        self.isHoldingScreen = true
//        //print(isHoldingScreen)
//        print("is true")
//    }
    
    func holdScreen() {
        
    }
    
    func rotateSprite() {
        let oneRevolution = SKAction.rotate(byAngle: CGFloat.pi * 1.2, duration: TimeInterval(elapsedTime))
        let wait = SKAction.wait(forDuration: 0.50)
        let sequence = SKAction.sequence([oneRevolution, wait, oneRevolution])
        let repeatRotate = SKAction.repeatForever(sequence)
        self.run(oneRevolution)
        print("rotate function running")
        
    }

    
}
