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


class GameScene: SKScene {
    
    let colorBar = SKSpriteNode()
    let blueButton = SKSpriteNode()
    let greenButton = SKSpriteNode()
    let yellowButton = SKSpriteNode()
    let redButton = SKSpriteNode()
    let seperatorLine = SKSpriteNode()
    let bottomLine = SKSpriteNode()
    let pauseButton = SKSpriteNode(imageNamed: "pauseIcon")

    var colorSwitch: SKSpriteNode!
    var currentColorIndex: Int?
    var score = 0
    var fallingSpeed = Int()
    
    override func didMove(to view: SKView) {
        let backgroundSound = SKAudioNode(fileNamed: "Mining by Moonlight.mp3")
        self.addChild(backgroundSound)
        layoutScene()
        setupPhysics()
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        spawnBallOne()
        //spawnBallTwo()
        //spawnBallThree()
        
        colorBar.name = "ColorBar"
        colorBar.color = .lightGray
        colorBar.size = CGSize(width: frame.width, height: frame.height/8)
        colorBar.position = CGPoint(x: frame.midX, y: frame.minY + frame.width/5 + frame.width/5)
        colorBar.zPosition = ZPositions.colorBar
        colorBar.physicsBody = SKPhysicsBody(rectangleOf: colorBar.size)
        colorBar.physicsBody?.categoryBitMask = PhysicsCategories.barCategory
        colorBar.physicsBody?.isDynamic = false
        addChild(colorBar)
        
        blueButton.name = "Blue"
        blueButton.color = UIColor(red: 0.54, green: 0.54, blue: 0.85, alpha: 1.0)
        blueButton.size = CGSize(width: frame.width/4, height: frame.width/4)
        blueButton.position = CGPoint(x: frame.midX/4, y: frame.minY + frame.width/5)
        blueButton.zPosition = ZPositions.buttons
        addChild(blueButton)

        greenButton.name = "Green"
        greenButton.color = UIColor(red: 0.16, green: 0.84, blue: 0.48, alpha: 1.0)
        greenButton.size = CGSize(width: frame.width/4, height: frame.width/4)
        greenButton.position = CGPoint(x: frame.midX/4 + frame.width/4 , y: frame.minY + frame.width/5)
        greenButton.zPosition = ZPositions.buttons
        addChild(greenButton)
        
        yellowButton.name = "Yellow"
        yellowButton.color = UIColor(red: 1.00, green: 1.00, blue: 0.40, alpha: 1.0)
        yellowButton.size = CGSize(width: frame.width/4, height: frame.width/4)
        yellowButton.position = CGPoint(x: frame.midX/4 + (frame.width/4)*2 , y: frame.minY + frame.width/5)
        yellowButton.zPosition = ZPositions.buttons
        addChild(yellowButton)
        
        redButton.name = "Red"
        redButton.color = UIColor(red: 0.88, green: 0.31, blue: 0.59, alpha: 1.0)
        redButton.size = CGSize(width: frame.width/4, height: frame.width/4)
        redButton.position = CGPoint(x: frame.midX/4 + (frame.width/4)*3 , y: frame.minY + frame.width/5)
        redButton.zPosition = ZPositions.buttons
        addChild(redButton)
        
        seperatorLine.name = "SeperatorLine"
        seperatorLine.color = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        seperatorLine.size = CGSize(width: frame.width, height: frame.height/50)
        seperatorLine.position = CGPoint(x: frame.midX, y: frame.minY + (frame.width/5 + frame.width/8))
        seperatorLine.zPosition = ZPositions.line
        addChild(seperatorLine)
        
        bottomLine.name = "BottomLine"
        bottomLine.color = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        bottomLine.size = CGSize(width: frame.width, height: frame.height/10)
        bottomLine.position = CGPoint(x: frame.midX, y: frame.minY)
        bottomLine.zPosition = ZPositions.line
        addChild(bottomLine)
        
        pauseButton.name = "Pause"
        pauseButton.size = CGSize(width: frame.size.width/10, height: frame.size.width/10)
        pauseButton.position = CGPoint(x: frame.midX + frame.width/2.5, y: frame.maxY - frame.width/5)
        pauseButton.zPosition = ZPositions.pause
        addChild(pauseButton)

    }
    
    func setupPhysics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: Double(fallingSpeed)) // manipulates how fast the ball drops based on gravity
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
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.barCategory
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
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.barCategory
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
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.barCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        addChild(ball)
        
    }
    
    func spawnAllBalls() {
        spawnBallOne()
        //spawnBallTwo()
        //spawnBallThree()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if blueButton.contains(location) {
                colorBar.color = UIColor(red: 0.54, green: 0.54, blue: 0.85, alpha: 1.0)
            } else if greenButton.contains(location) {
                colorBar.color = UIColor(red: 0.16, green: 0.84, blue: 0.48, alpha: 1.0)
            } else if yellowButton.contains(location) {
                colorBar.color = UIColor(red: 1.00, green: 1.00, blue: 0.40, alpha: 1.0)
            } else if redButton.contains(location) {
                colorBar.color = UIColor(red: 0.88, green: 0.31, blue: 0.59, alpha: 1.0)
            } else if pauseButton.contains(location) {
                if self.scene?.view?.isPaused == false {
                    self.scene?.view?.isPaused = true
                } else {
                    self.scene?.view?.isPaused = false
                }
            }
        }
        
    }

    func gameOver() {
        let menuScene = MenuScene(size: view!.bounds.size)
        view!.presentScene(menuScene)
    }
   
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if contactMask == PhysicsCategories.ballCategory | PhysicsCategories.barCategory {
            print("There was Contact!")
            if let ball = contact.bodyA.node?.name == "ball" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                if ball.color == colorBar.color {
                    run(SKAction.playSoundFileNamed("Ka-Ching.wav", waitForCompletion: false)) // add soundfile above info.plist
                    ball.run(SKAction.fadeIn(withDuration: 0.25), completion: {
                        ball.removeFromParent()
                        self.spawnAllBalls()
                    })
                } else if score % 10 == 0 {
                    fallingSpeed += Int(0.01)
                } else {
                    gameOver()
                }
            }
        }
    }
}
