//
//  GameOverScene.swift
//  FallingDots
//
//  Created by Matthew Huie on 3/7/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene {
    
    let menuLabel = SKLabelNode(text: "Main Menu")
    let gameOverLabel = SKLabelNode(text: "Game Over")

    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addMenuUI()
        
    }
    
    func addMenuUI() {
        
        gameOverLabel.fontName = "MarkerFelt-Wide"
        gameOverLabel.fontColor = .red
        gameOverLabel.fontSize = 60.0
        gameOverLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(gameOverLabel)
        
        
        menuLabel.fontName = "MarkerFelt-Thin"
        menuLabel.fontSize = 30.0
        menuLabel.position = CGPoint(x: frame.midX, y: frame.midY - gameOverLabel.frame.size.height*4)
        animate(label: menuLabel)
        addChild(menuLabel)
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
            if menuLabel.contains(location) {
                let menu = MenuScene(size: view!.bounds.size)
                view!.presentScene(menu)
            }
        }
        
    }
}
