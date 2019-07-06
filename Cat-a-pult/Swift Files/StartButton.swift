import SpriteKit

class StartButton: SKSpriteNode{
    
    func didMoveToScene() {
        print("hello")
        isUserInteractionEnabled = true
    }
    
    func startGame() {
        let scene = GameScene(fileNamed: "Scene0")
        scene!.scaleMode = .aspectFill
        
        return
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        _ = touches.first!
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        print("touchEnded")
        if self.frame.contains(touch.previousLocation(in: self)) {
            startGame()
        }
    }
}
