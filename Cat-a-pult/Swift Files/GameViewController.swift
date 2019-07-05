//
//  GameView.swift
//  Cat-a-pult
//
//  Created by Zachary Carreiro on 2019-06-20.
//  Copyright © 2019 Team Cat. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
        func preferStatusBarHidden() -> Bool {
        return true
    }
}
