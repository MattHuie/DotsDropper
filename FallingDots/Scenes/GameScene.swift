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
    
    override func didMove(to view: SKView) {
        layoutScene()
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)

    }
   
}
