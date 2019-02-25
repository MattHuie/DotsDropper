//
//  GameScene.swift
//  FallingDots
//
//  Created by Matthew Huie on 2/7/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import SpriteKit

enum PlayColors {
    static let colors = [
        UIColor(red: 0.54, green: 0.54, blue: 0.85, alpha: 1.0), // blue
        UIColor(red: 0.16, green: 0.84, blue: 0.48, alpha: 1.0), // green
        UIColor(red: 1.00, green: 1.00, blue: 0.40, alpha: 1.0), // yellow
        UIColor(red: 0.88, green: 0.31, blue: 0.59, alpha: 1.0)  // red
    ]
}

enum SwitchState: Int {
    case blue, green, yellow, red
}

class GameScene: SKScene {
    
    var colorSwitch: SKSpriteNode!
    var currentColorIndex: Int?
    var switchState = SwitchState.blue
    
    override func didMove(to view: SKView) {
        layoutScene()
        setupPhysics()
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        spawnBallOne()
        //spawnBallTwo()
        //spawnBallThree()
        colorWheel()

    }
    
    func setupPhysics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0) // manipulates how fast the ball drops based on gravity
        physicsWorld.contactDelegate = self
    }
    
    func spawnBallOne() {
        currentColorIndex = Int(arc4random_uniform(UInt32(4)))
        
        let ball = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: PlayColors.colors[currentColorIndex!], size: CGSize(width: 30.0, height: 30.0))
        ball.colorBlendFactor = 1.0
        ball.name = "ball"
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        ball.zPosition = ZPositions.ball
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = PhysicsCategories.ballCategory
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        addChild(ball)

    }
    
    func spawnBallTwo() {
        
        let ball = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: PlayColors.colors[currentColorIndex!], size: CGSize(width: 30.0, height: 30.0))
        ball.colorBlendFactor = 1.0
        ball.name = "ball2"
        ball.position = CGPoint(x: frame.midX / 2, y: frame.maxY)
        ball.zPosition = ZPositions.ball
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = PhysicsCategories.ballCategory
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        addChild(ball)
        
    }
    
    func spawnBallThree() {
        
        let ball = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: PlayColors.colors[currentColorIndex!], size: CGSize(width: 30.0, height: 30.0))
        ball.colorBlendFactor = 1.0
        ball.name = "ball3"
        ball.position = CGPoint(x: frame.midX + (frame.midX / 2), y: frame.maxY)
        ball.zPosition = ZPositions.ball
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = PhysicsCategories.ballCategory
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        addChild(ball)
        
    }
    
    func spawnAllBalls() {
        spawnBallOne()
        //spawnBallTwo()
        //spawnBallThree()
    }
    
    func colorWheel() {
        colorSwitch = SKSpriteNode(imageNamed: "ColoredCircle")
        colorSwitch.size = CGSize(width: frame.size.width/3.5, height: frame.size.width/3.5)
        colorSwitch.position = CGPoint(x: frame.midX, y: frame.minY +
            colorSwitch.size.height)
        colorSwitch.zPosition = ZPositions.colorSwitch
        colorSwitch.physicsBody = SKPhysicsBody(circleOfRadius: colorSwitch.size.width/2)
        colorSwitch.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory
        colorSwitch.physicsBody?.isDynamic = false
        addChild(colorSwitch)
    }
   
    func turnWheel() {
        if let newState = SwitchState(rawValue: switchState.rawValue + 1) {
            switchState = newState
        } else {
            switchState = .blue
        }
        
        colorSwitch.run(SKAction.rotate(byAngle: .pi/2, duration: 0.25))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        turnWheel()
    }
    
    func gameOver() {
        let menuScene = MenuScene(size: view!.bounds.size)
        view!.presentScene(menuScene)
    }
   
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if contactMask == PhysicsCategories.ballCategory | PhysicsCategories.switchCategory {
            // print("There was Contact!")
            if let ball = contact.bodyA.node?.name == "ball" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                if currentColorIndex == switchState.rawValue {
                    // run(SKAction.playSoundFileNamed("", waitForCompletion: false)) // add soundfile above info.plist
                    
                    ball.run(SKAction.fadeIn(withDuration: 0.25), completion: {
                        ball.removeFromParent()
                        self.spawnAllBalls()
                    })
                } else {
                    gameOver()
                }
            }
        }
    }
}
