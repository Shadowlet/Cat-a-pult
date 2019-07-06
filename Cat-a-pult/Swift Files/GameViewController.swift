import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        let scene = GameScene(fileNamed: "Scene0")
        scene!.scaleMode = .aspectFill
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true

        skView.presentScene(scene)
    }
    
        func preferStatusBarHidden() -> Bool {
        return true
    }
}
