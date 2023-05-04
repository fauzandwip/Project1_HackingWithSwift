//
//  GameScene.swift
//  Project11
//
//  Created by Fauzan Dwi Prasetyo on 03/05/23.
//

import SpriteKit

class GameScene: SKScene {
    
    var balls = ["ballBlue", "ballCyan", "ballGreen", "ballGrey", "ballRed", "ballYellow", "ballPurple"]
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jp")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -2
        addChild(background)
        
        let name = SKLabelNode(text: "patito")
        name.position = CGPoint(x: 980, y: 740)
        name.color = .gray
        name.zPosition = 1
        addChild(name)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: 256, y: 0))
        makeBouncer(at: CGPoint(x: 512, y: 0))
        makeBouncer(at: CGPoint(x: 768, y: 0))
        makeBouncer(at: CGPoint(x: 1024, y: 0))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let ball = SKSpriteNode(imageNamed: "ballCyan")
            ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
            ball.physicsBody?.restitution = 0.4
            ball.position = location
            addChild(ball)
        }
    }
    
    func makeBouncer(at position: CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
        bouncer.physicsBody?.isDynamic = false
        addChild(bouncer)
    }
    
}
