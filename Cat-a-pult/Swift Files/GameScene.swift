//
//  GameScene.swift
//  Cat-a-pult
//
//  Created by Zachary Carreiro on 2019-06-19.
//  Copyright © 2019 Team Cat. All rights reserved.
//

import SpriteKit
import GameplayKit

protocol EventListenerNode {
    func didMoveToScene()
}
protocol InteractiveNode {
    func interact()
}

struct PhysicsCategory {
    static let None: UInt32 = 0
    static let Cat: UInt32 = 0b1 // 1
    static let Block: UInt32 = 0b10 // 2
    static let Edge: UInt32 = 0b100 // 4
    static let Cannon: UInt32 = 0b1000 // 8
    static let King: UInt32 = 0b10000 // 16
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let blueBin = SKSpriteNode()
    let yellowBin = SKSpriteNode()
    let label = SKLabelNode()
    var pullback: PullbackNode!
    var catapultNode: SKSpriteNode!
    var orangeCat: SKSpriteNode!

    var elapsedTime: CGFloat = 0
    var startTime: CGFloat?
    //
    //
    var isHoldingScreen = false
    var catLaunched = false
    
    let velocityX: Float = 454.54
    let velocityY: Float = 454.54
    override func didMove(to view: SKView) {
        
        pullback = scene?.childNode(withName: "Catapult_Arm") as? PullbackNode
        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
            }
        })
        
        
        catapultNode = scene?.childNode(withName: "Catapult_Arm") as? SKSpriteNode
        catapultNode.zPosition = 2
        
        
    
        
        // Playable margin..
        let maxAspectRatio: CGFloat = 16.0/9.0
        let maxAspectRatioHeight = size.width / maxAspectRatio
        let playableMargin: CGFloat = (size.height - maxAspectRatioHeight)/2
        
        let playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: size.height-playableMargin*2)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        
        setupCat()
    }
    
    // We will use this to switch from the menu scene to the game scene
    var currentScene: Int = 0
    class func level(sceneNum: Int) -> GameScene? {
        let scene = GameScene(fileNamed: "Scene\(sceneNum)")!
        scene.currentScene = sceneNum
        scene.scaleMode = .aspectFill
        return scene
    }
    
    override func update(_ currentTime: TimeInterval) {
        //pullback.update(currentTime)
        if isHoldingScreen == true {
            updateTimer(currentTime: currentTime)
            print(elapsedTime)
        }
        
    }

    func updateTimer(currentTime: TimeInterval) {
        // 1
        if let startTime = startTime {
            // 2
            elapsedTime = CGFloat(CGFloat(currentTime) - startTime)
        } else {
            // 3
            startTime = CGFloat(CGFloat(currentTime) - elapsedTime)
        }
    }
    
    func setLaunchParams() {
        
        if isHoldingScreen == true {
            orangeCat.physicsBody?.isDynamic = true
            orangeCat.physicsBody?.affectedByGravity = true
        } else if catLaunched == false {
            orangeCat.physicsBody?.isDynamic = false
            orangeCat.physicsBody?.affectedByGravity = false
        }
        
    }
    
    func launchCat() {
        let catX: CGFloat = CGFloat(orangeCat.position.x)
        let catY: CGFloat = CGFloat(orangeCat.position.y)
        //
        let XX: CGFloat = CGFloat(elapsedTime) * CGFloat(velocityX)
        let YY: CGFloat = CGFloat(elapsedTime) * CGFloat(velocityY)
        
        orangeCat.physicsBody?.applyImpulse(CGVector(dx: XX, dy: YY))
        
    }
    
    func setupCat() {
        orangeCat = SKSpriteNode(imageNamed: "OrangeCat")
        orangeCat.position = CGPoint(x: catapultNode.position.x - catapultNode.position.length() / 2, y: catapultNode.position.y)
        orangeCat.zPosition = 5
        
        orangeCat.physicsBody = SKPhysicsBody(rectangleOf: orangeCat.size)
        orangeCat.physicsBody?.isDynamic = false
        orangeCat.physicsBody?.affectedByGravity = false
        addChild(orangeCat)
        
        print("catapult position", catapultNode.position)
        print("cat position", orangeCat.position)
        print("catapult length", catapultNode.position.length())
        print("cat length", orangeCat.position.length())
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        catLaunched = true
        if catLaunched == true {
            launchCat()
            
            //print("cat should have launched")
        }
        isHoldingScreen = false
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let prevTouch = touch.previousLocation(in: self)
        if orangeCat.frame.contains(prevTouch) {
            isHoldingScreen = true
            setLaunchParams()
            
        }
    }
}

extension BinaryInteger {
    var degreesToRadians: CGFloat { return CGFloat(self) * π / 180 }
}

//extension FloatingPoint {
//    var degreesToRadians: Self { return self * π / 180 }
//    var radiansToDegrees: Self { return self * 180 / π }
//}
