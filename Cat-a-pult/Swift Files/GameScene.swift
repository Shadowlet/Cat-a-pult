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
    
    var blockOne = SKSpriteNode()
    var blockTwo = SKSpriteNode()
    var blockThree = SKSpriteNode()
    var blockSprite = SKSpriteNode()
    var buttonSprite = SKReferenceNode()
    
    var blockCount: Int = 0
    var blockArray: [SKSpriteNode] = [SKSpriteNode]()

    
    let label = SKLabelNode()
    
    
    // UI
    var buttonFinish = SKShapeNode(circleOfRadius: 100)
    var blockHUD = SKSpriteNode()
    let labelBlock = SKLabelNode()
    
    public var blockNum: Int = 0
    var maxBlocks: Int = 3
    
    
    
    override func didMove(to view: SKView) {
        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
            }
        })
        
        // Playable margin..
        let maxAspectRatio: CGFloat = 16.0/9.0
        let maxAspectRatioHeight = size.width / maxAspectRatio
        let playableMargin: CGFloat = (size.height - maxAspectRatioHeight)/2
        
        let playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: size.height-playableMargin*2)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        physicsWorld.contactDelegate = self

        
//        setupDragLabel()
        //setupCreationBlocks()
        setupCreationUI()
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
    
    func setupCreationBlocks() {
        
        
        
//        yellowBin.color = SKColor.yellow
//        yellowBin.size = CGSize(width: 200, height: 200)
//        yellowBin.position = CGPoint(x: 200, y: 1000)
//        yellowBin.zPosition = 1
//        addChild(yellowBin)
//
//        blueBin.color = SKColor.blue
//        blueBin.size = CGSize(width: 200, height: 200)
//        blueBin.position = CGPoint(x: 1500, y: 300)
//        blueBin.zPosition = 1
//        addChild(blueBin)
        
    }
    
    func setupCreationUI() {
        // Playable margin..
        let maxAspectRatio: CGFloat = 16.0/9.0
        let maxAspectRatioHeight = size.width / maxAspectRatio
        let playableMargin: CGFloat = (size.height - maxAspectRatioHeight)/2
        
        blockHUD.color = SKColor.white
        blockHUD.size = CGSize(width: size.width, height: size.height * 0.15)
        blockHUD.position = CGPoint(x: size.width/2, y: size.height-playableMargin*1.60)
        blockHUD.zPosition = 1
        addChild(blockHUD)
       
        buttonFinish.position = CGPoint(x: 1850, y: 950)
        buttonFinish.strokeColor = UIColor.black
        buttonFinish.glowWidth = 1.0
        buttonFinish.fillColor = UIColor.red
        addChild(buttonFinish)
        
        blockOne = SKSpriteNode(imageNamed: "wood_horiz1")
        blockOne.setScale(0.5)
        blockOne.position = CGPoint(x: 300, y: 1225)
        blockOne.zPosition = 2
        blockOne.physicsBody?.isDynamic = false
        addChild(blockOne)
        //
        //
        blockTwo = SKSpriteNode(imageNamed: "wood_vert1")
        blockTwo.setScale(0.5)
        blockTwo.position = CGPoint(x: 600, y: 1225)
        blockTwo.zPosition = 2
        blockTwo.physicsBody?.isDynamic = false
        addChild(blockTwo)
        //
        //
        blockThree = SKSpriteNode(imageNamed: "rock_L_horizontal")
        blockThree.setScale(0.5)
        blockThree.position = CGPoint(x: 900, y: 1225)
        blockThree.zPosition = 2
        blockThree.physicsBody?.isDynamic = false
        addChild(blockThree)
       
        
        labelBlock.fontName = "Arial"
        labelBlock.fontSize = 140
        labelBlock.color = SKColor.black
        labelBlock.position = CGPoint(x: frame.midX, y: frame.midY)
        labelBlock.text = "\(blockCount)"
        addChild(labelBlock)
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
////        let touch = touches.first!
////        
//        if label.frame.contains(touch.previousLocation(in: self)){
//            label.position = touch.location(in: self)
////        }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
////        if label.name == "yellow" {
////            if yellowBin.frame.contains(label.position) {
////                //remove and create a new label
////                label.removeFromParent()
////                setupDragLabel()
////            }
////        }
////
////        if label.name == "blue" {
////            if blueBin.frame.contains(label.position) {
////                //remove and create a new label
////                label.removeFromParent()
////                setupDragLabel()
////            }
////        }
//    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        if (currentBlock != nil) {
            if (currentBlock?.frame.contains(touch.previousLocation(in: self)))! {
                currentBlock?.position = touch.location(in: self)

            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        print(blockSprite.position)
        
        //blockSprite.removeFromParent()
        
        if buttonFinish.frame.contains(touch.previousLocation(in: self)) {
            for n in 0...blockCount-1 {
                print(n)
                blockArray[n].physicsBody?.affectedByGravity = true
            }
        }
        currentBlock = nil
        
        
    }
    
    func newBlock(touchSpot: UITouch, theThing: String) {
        
        blockSprite = SKSpriteNode(imageNamed: theThing)
        blockSprite.position = touchSpot.location(in: self)
        blockCount += 1
        print("block 1")
        labelBlock.text = "\(blockCount)"
        currentBlock = blockSprite
        
        
        
        
        
        //block.n("Block\(1)")
        //blockSprite.physicsBody?.
        blockSprite.physicsBody = SKPhysicsBody(rectangleOf: blockSprite.size)
        blockSprite.physicsBody?.isDynamic = true
        blockSprite.physicsBody?.affectedByGravity = false
        blockSprite.physicsBody?.node?.name = "BlockNode"
        blockSprite.zPosition = 10
        //blockSprite.anchorPoint = CGPoint(x: blockSprite.frame.width/2, y: 0)
        addChild(blockSprite)
        blockArray.append(blockSprite)
        
        //interact()
    }
    
    var currentBlock: SKSpriteNode?
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first!
        if blockOne.frame.contains(touch.previousLocation(in: self)) {
            newBlock(touchSpot: touch, theThing: "wood_horiz1")
        } else if blockTwo.frame.contains(touch.previousLocation(in: self)) {
            newBlock(touchSpot: touch, theThing: "wood_vert1")
        } else if blockThree.frame.contains(touch.previousLocation(in: self)) {
            newBlock(touchSpot: touch, theThing: "rock_L_horizontal")
        } else {
            
            if blockCount >= 1 {
                for n in 0...blockCount-1 {
                    if blockArray[n].frame.contains(touch.previousLocation(in: self)) {
                        currentBlock = blockArray[n]
                        break
                    }
                }
            }
            
        }
        
        
        
        
        
        
    }
    
    
}
