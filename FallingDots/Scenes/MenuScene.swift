//
//  MenuScene.swift
//  FallingDots
//
//  Created by Matthew Huie on 2/12/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {

    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addMenuUI()

    }
    
    func addMenuUI() {
        let titleLabel = SKLabelNode(text: "Falling Dots")
        titleLabel.fontName = "MarkerFelt-Wide"
        titleLabel.fontSize = 50.0
        titleLabel.fontColor = .white
        titleLabel.position = CGPoint(x: frame.midX, y: frame.midY + titleLabel.frame.size.height*3)
        addChild(titleLabel)
        
        
        let playLabel = SKLabelNode(text: "Tap to Play")
        playLabel.fontName = "MarkerFelt-Thin"
        playLabel.fontSize = 40.0
        playLabel.fontColor = .white
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY - playLabel.frame.size.height*3)
        addChild(playLabel)
        animate(label: playLabel)
    }
    
    func animate(label: SKLabelNode) {
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
        let sequence = SKAction.sequence([scaleUp, scaleDown])
        label.run(SKAction.repeatForever(sequence))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view!.presentScene(gameScene)
    }
}
