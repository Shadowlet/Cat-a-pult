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
    
    override func didMove(to view: SKView) {
        
        // Playable margin..
        let maxAspectRatio: CGFloat = 16.0/9.0
        let maxAspectRatioHeight = size.width / maxAspectRatio
        let playableMargin: CGFloat = (size.height - maxAspectRatioHeight)/2
        
        let playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: size.height-playableMargin*2)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        
        setupDragLabel()
        setupTargets()
    }
    
    // We will use this to switch from the menu scene to the game scene
    var currentScene: Int = 0
    class func level(sceneNum: Int) -> GameScene? {
        let scene = GameScene(fileNamed: "Scene\(sceneNum)")!
        scene.currentScene = sceneNum
        scene.scaleMode = .aspectFill
        return scene
    }
    
    func setupDragLabel() {
        //set the font and position of the label
        label.fontName = "Arial"
        label.fontSize = 140
        label.color = SKColor.black
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        
        // Get a random bool
        let blue = Bool.random()
        
        if blue {
            label.text = "blue"
            label.name = "blue"
        } else {
            label.text = "yellow"
            label.name = "yellow"
        }
        
        addChild(label)
    }
    
    func setupTargets() {
        
        yellowBin.color = SKColor.yellow
        yellowBin.size = CGSize(width: 200, height: 200)
        yellowBin.position = CGPoint(x: 200, y: 1000)
        yellowBin.zPosition = 1
        addChild(yellowBin)
        
        blueBin.color = SKColor.blue
        blueBin.size = CGSize(width: 200, height: 200)
        blueBin.position = CGPoint(x: 1500, y: 300)
        blueBin.zPosition = 1
        addChild(blueBin)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        
        if label.frame.contains(touch.previousLocation(in: self)){
            label.position = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if label.name == "yellow" {
            if yellowBin.frame.contains(label.position) {
                //remove and create a new label
                label.removeFromParent()
                setupDragLabel()
            }
        }
        
        if label.name == "blue" {
            if blueBin.frame.contains(label.position) {
                //remove and create a new label
                label.removeFromParent()
                setupDragLabel()
            }
        }
    }
}
