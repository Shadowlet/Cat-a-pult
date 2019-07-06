import SpriteKit

class CatapultNode: SKSpriteNode{
    
    var catapult: SKSpriteNode!
    var cat: SKSpriteNode!
    private var xFloat: CGFloat?
    private var yFloat: CGFloat?
    
    let oneRevolution = SKAction.rotate(byAngle: CGFloat.pi * -2, duration: 3)

    
    
    func didMoveToScene() {
        //let catapultBodyTexture = SKTexture(imageNamed: "catapult")
        
        
    }

    func update(_ currentTime: TimeInterval) {
        self.run(oneRevolution)
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    
}
