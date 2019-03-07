//
//  HiScoreScene.swift
//  FallingDots
//
//  Created by Matthew Huie on 3/6/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit
import SpriteKit

class HiScoreScene: SKScene {

    let titleLabel = SKLabelNode(text: "Hi-Scores")
    let easyScoreLabel = SKLabelNode(text: "Easy: 0")
    let mediumScoreLabel = SKLabelNode(text: "Medium: 0")
    let hardScoreLabel = SKLabelNode(text: "Hard: 0")
    let menuLabel = SKLabelNode(text: "Main Menu")
    
    
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
        
        easyScoreLabel.fontName = "MarkerFelt-Wide"
        easyScoreLabel.fontSize = 40.0
        easyScoreLabel.fontColor = .white
        easyScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY + easyScoreLabel.frame.size.height*2)
        addChild(easyScoreLabel)
        
        mediumScoreLabel.fontName = "MarkerFelt-Wide"
        mediumScoreLabel.fontSize = 40.0
        mediumScoreLabel.fontColor = .white
        mediumScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(mediumScoreLabel)
        
        hardScoreLabel.fontName = "MarkerFelt-Wide"
        hardScoreLabel.fontSize = 40.0
        hardScoreLabel.fontColor = .white
        hardScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - hardScoreLabel.frame.size.height*2.5)
        addChild(hardScoreLabel)
        
        menuLabel.fontName = "MarkerFelt-Thin"
        menuLabel.fontSize = 25.0
        menuLabel.fontColor = .white
        menuLabel.position = CGPoint(x: frame.midX, y: frame.midY - hardScoreLabel.frame.size.height*8)
        addChild(menuLabel)
        animate(label: menuLabel)
        
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
