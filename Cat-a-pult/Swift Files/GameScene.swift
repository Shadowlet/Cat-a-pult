import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var playButton: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        addPlayButton()
    }
    
    func addPlayButton(){
        
        playButton = SKSpriteNode(imageNamed: "StartButton")
        playButton.position = CGPoint(x: 0 ,y: -86)
            playButton.xScale = 3.0
            playButton.yScale = 3.0
        playButton.zPosition = 10
        addChild(playButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let prevTouch = touch.previousLocation(in: self)
        
        if playButton.frame.contains(touch.previousLocation(in: self)) {
            print("hello")
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            let letsPlay = SKScene(fileNamed: "Scene2")!
            self.view?.presentScene(letsPlay, transition: reveal)
        }
    }
   
    override func update(_ currentTime: CFTimeInterval) {
    
    }
}
