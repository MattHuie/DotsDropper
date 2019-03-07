//
//  TutorialScene.swift
//  FallingDots
//
//  Created by Matthew Huie on 3/6/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit
import SpriteKit

class TutorialScene: SKScene {

    let titleLabel = SKLabelNode(text: "Welcome to Falling Dots")
    let blueBall = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: UIColor(red: 0.54, green: 0.54, blue: 0.85, alpha: 1.0), size: CGSize(width: 30.0, height: 30.0))
    let greenBall = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: UIColor(red: 0.16, green: 0.84, blue: 0.48, alpha: 1.0), size: CGSize(width: 30.0, height: 30.0))
    let yellowBall = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: UIColor(red: 1.00, green: 1.00, blue: 0.40, alpha: 1.0), size: CGSize(width: 30.0, height: 30.0))
    let redBall = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: UIColor(red: 0.88, green: 0.31, blue: 0.59, alpha: 1.0), size: CGSize(width: 30.0, height: 30.0))
    let lineOne = SKLabelNode(text: " A colored ball will fall from the top of the screen.")
    let barOne = SKSpriteNode()
    let blueButton = SKSpriteNode()
    let greenButton = SKSpriteNode()
    let yellowButton = SKSpriteNode()
    let redButton = SKSpriteNode()
    let lineTwo = SKLabelNode(text: "There are 4 buttons on the bottom of the screen that changes the color of the bar above it.")
    let ballOne = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: UIColor(red: 0.54, green: 0.54, blue: 0.85, alpha: 1.0), size: CGSize(width: 30.0, height: 30.0))
    let barTwo = SKSpriteNode()
    let lineThree = SKLabelNode(text: "Match the color of the bar to the color of the ball via the buttons. The game ends when they do not match.")
    let menuButton = SKLabelNode(text: "Main Menu")
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addMenuUI()
        
    }
    
    func addMenuUI() {
        
        titleLabel.fontName = "MarkerFelt-Wide"
        titleLabel.fontSize = 30.0
        titleLabel.fontColor = .white
        titleLabel.position = CGPoint(x: frame.midX, y: frame.midY + titleLabel.frame.size.height*9)
        addChild(titleLabel)
        
        blueBall.position = CGPoint(x: frame.midX/4, y: frame.midY + titleLabel.frame.size.height*7)
        blueBall.colorBlendFactor = 1.0
        addChild(blueBall)
        
        greenBall.position = CGPoint(x: frame.midX/4 + frame.midX/2, y: frame.midY + titleLabel.frame.size.height*7)
        greenBall.colorBlendFactor = 1.0
        addChild(greenBall)
        
        yellowBall.position = CGPoint(x: frame.midX/4 + (frame.midX/2)*2, y: frame.midY + titleLabel.frame.size.height*7)
        yellowBall.colorBlendFactor = 1.0
        addChild(yellowBall)
        
        redBall.position = CGPoint(x: frame.midX/4 + (frame.midX/2)*3, y: frame.midY + titleLabel.frame.size.height*7)
        redBall.colorBlendFactor = 1.0
        addChild(redBall)
        
        lineOne.fontName = "MarkerFelt-Thin"
        lineOne.fontSize = 20.0
        lineOne.fontColor = .white
        lineOne.lineBreakMode = NSLineBreakMode.byWordWrapping
        lineOne.numberOfLines = 0
        lineOne.preferredMaxLayoutWidth = 400
        lineOne.position = CGPoint(x: frame.midX, y: frame.midY + titleLabel.frame.size.height*4.8)
        addChild(lineOne)
        
        barOne.name = "ColorBar"
        barOne.color = .lightGray
        barOne.size = CGSize(width: frame.width, height: frame.width/8)
        barOne.position = CGPoint(x: frame.midX, y: frame.midY + titleLabel.frame.size.height*3.5)
        addChild(barOne)
        
        blueButton.name = "Blue"
        blueButton.color = UIColor(red: 0.54, green: 0.54, blue: 0.85, alpha: 1.0)
        blueButton.size = CGSize(width: frame.width/6, height: frame.width/6)
        blueButton.position = CGPoint(x: frame.midX/4, y: frame.midY + titleLabel.frame.size.height*1.5)
        blueButton.zPosition = ZPositions.buttons
        addChild(blueButton)
        
        greenButton.name = "Green"
        greenButton.color = UIColor(red: 0.16, green: 0.84, blue: 0.48, alpha: 1.0)
        greenButton.size = CGSize(width: frame.width/6, height: frame.width/6)
        greenButton.position = CGPoint(x: frame.midX/4 + frame.width/4 , y: frame.midY + titleLabel.frame.size.height*1.5)
        addChild(greenButton)
        
        yellowButton.name = "Yellow"
        yellowButton.color = UIColor(red: 1.00, green: 1.00, blue: 0.40, alpha: 1.0)
        yellowButton.size = CGSize(width: frame.width/6, height: frame.width/6)
        yellowButton.position = CGPoint(x: frame.midX/4 + (frame.width/4)*2 , y: frame.midY + titleLabel.frame.size.height*1.5)
        addChild(yellowButton)
        
        redButton.name = "Red"
        redButton.color = UIColor(red: 0.88, green: 0.31, blue: 0.59, alpha: 1.0)
        redButton.size = CGSize(width: frame.width/6, height: frame.width/6)
        redButton.position = CGPoint(x: frame.midX/4 + (frame.width/4)*3 , y: frame.midY + titleLabel.frame.size.height*1.5)
        addChild(redButton)
        
        lineTwo.fontName = "MarkerFelt-Thin"
        lineTwo.fontSize = 20.0
        lineTwo.fontColor = .white
        lineTwo.lineBreakMode = NSLineBreakMode.byWordWrapping
        lineTwo.numberOfLines = 0
        lineTwo.preferredMaxLayoutWidth = 350
        lineTwo.position = CGPoint(x: frame.midX, y: frame.midY - titleLabel.frame.size.height*2.5)
        addChild(lineTwo)
        
        ballOne.position = CGPoint(x: frame.midX, y: frame.midY - titleLabel.frame.size.height*3)
        ballOne.colorBlendFactor = 1.0
        addChild(ballOne)
        
        barTwo.name = "ColorBar"
        barTwo.color = UIColor(red: 0.54, green: 0.54, blue: 0.85, alpha: 1.0)
        barTwo.size = CGSize(width: frame.width, height: frame.width/8)
        barTwo.position = CGPoint(x: frame.midX, y: frame.midY - titleLabel.frame.size.height*5)
        addChild(barTwo)
        
        lineThree.fontName = "MarkerFelt-Thin"
        lineThree.fontSize = 20.0
        lineThree.fontColor = .white
        lineThree.lineBreakMode = NSLineBreakMode.byWordWrapping
        lineThree.numberOfLines = 0
        lineThree.preferredMaxLayoutWidth = 350
        lineThree.position = CGPoint(x: frame.midX, y: frame.midY - titleLabel.frame.size.height*8.5)
        addChild(lineThree)
        
        menuButton.fontName = "MarkerFelt-Thin"
        menuButton.fontSize = 25.0
        menuButton.position = CGPoint(x: frame.midX, y: frame.minY + titleLabel.frame.size.height)
        animate(label: menuButton)
        addChild(menuButton)
    }
    
    func animate(label: SKLabelNode) {
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
        let sequence = SKAction.sequence([scaleUp, scaleDown])
        label.run(SKAction.repeatForever(sequence))
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if menuButton.contains(location) {
                let menu = MenuScene(size: view!.bounds.size)
                view!.presentScene(menu)
            }
        }
        
    }
    
    
    
}
