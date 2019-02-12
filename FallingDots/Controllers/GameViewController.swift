//
//  GameViewController.swift
//  FallingDots
//
//  Created by Matthew Huie on 2/7/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            let scene = MenuScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
   
    }

    
}
