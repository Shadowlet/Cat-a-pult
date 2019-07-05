//
//  GameScene.swift
//  Cat-a-pult
//
//  Created by Zachary Carreiro on 2019-06-19.
//  Copyright © 2019 Team Cat. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let playButton = SKSpriteNode(imageNamed: "play_unpresed")
    
    override func didMove(to view: SKView) {
        
        backgroundColor = UIColor.green
        addPlayButton()
    }
    
    func addPlayButton(){
        
        playButton.position (
            playButton.xScale = 0.2,
            playButton.yScale = 0.2,
        self.addChild(playButton))
    }
    
    func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch in (touches as! Set<UITouch>){
            let location = touch.location(in: self)
            if self.atPoint(location) == self.playButton {
                let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                let letsPlay = playScene(size: self.size)
                self.view?.presentScene(letsPlay, transition: reveal)
            }
        }
    }
    override func update(_ currentTime: CFTimeInterval) {
    
    }
}
