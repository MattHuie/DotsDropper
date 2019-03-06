//
//  MenuScene.swift
//  FallingDots
//
//  Created by Matthew Huie on 2/12/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {

    let titleLabel = SKLabelNode(text: "Falling Dots")
    let easyLabel = SKLabelNode(text: "Easy")
    let mediumLabel = SKLabelNode(text: "Medium")
    let hardLabel = SKLabelNode(text: "Hard")
    let hiScoreLabel = SKLabelNode(text: "Hi-Scores")
    let tutorialLabel = SKLabelNode(text: "How to Play")
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addMenuUI()

    }
    
    func addMenuUI() {
        
        titleLabel.fontName = "MarkerFelt-Wide"
        titleLabel.fontSize = 50.0
        titleLabel.fontColor = .white
        titleLabel.position = CGPoint(x: frame.midX, y: frame.midY + titleLabel.frame.size.height*5)
        addChild(titleLabel)
        
        easyLabel.fontName = "MarkerFelt-Thin"
        easyLabel.fontSize = 40.0
        easyLabel.fontColor = .white
        easyLabel.position = CGPoint(x: frame.midX, y: frame.midY + easyLabel.frame.size.height)
        addChild(easyLabel)
        animate(label: easyLabel)
        
        mediumLabel.fontName = "MarkerFelt-Thin"
        mediumLabel.fontSize = 40.0
        mediumLabel.fontColor = .white
        mediumLabel.position = CGPoint(x: frame.midX, y: frame.midY - mediumLabel.frame.size.height/2)
        addChild(mediumLabel)
        animate(label: mediumLabel)
        
        hardLabel.fontName = "MarkerFelt-Thin"
        hardLabel.fontSize = 40.0
        hardLabel.fontColor = .white
        hardLabel.position = CGPoint(x: frame.midX, y: frame.midY - hardLabel.frame.size.height*2.1)
        addChild(hardLabel)
        animate(label: hardLabel)
        
        hiScoreLabel.fontName = "MarkerFelt-Thin"
        hiScoreLabel.fontSize = 30.0
        hiScoreLabel.fontColor = .white
        hiScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - hiScoreLabel.frame.size.height*8)
        addChild(hiScoreLabel)
        animate(label: hiScoreLabel)
        
        tutorialLabel.fontName = "MarkerFelt-Thin"
        tutorialLabel.fontSize = 30.0
        tutorialLabel.fontColor = .white
        tutorialLabel.position = CGPoint(x: frame.midX, y: frame.midY - tutorialLabel.frame.size.height*9.5)
        addChild(tutorialLabel)
        animate(label: tutorialLabel)
      
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
            if easyLabel.contains(location) {
                let gameScene = GameScene(size: view!.bounds.size)
                view!.presentScene(gameScene)
            } else if hiScoreLabel.contains(location) {
                let hiScoreScene = HiScoreScene(size: view!.bounds.size)
                view!.presentScene(hiScoreScene)
            } else if tutorialLabel.contains(location) {
                let tutorialScene = TutorialScene(size: view!.bounds.size)
                view!.presentScene(tutorialScene)
            }
            
        }
        
    }
}
