//
//  Settings.swift
//  FallingDots
//
//  Created by Matthew Huie on 2/14/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import SpriteKit

enum PhysicsCategories {
    static let none: UInt32 = 0
    static let ballCategory: UInt32 = 0x1
    static let switchCategory: UInt32 = 0x1 << 1
    
}

enum ZPositions { 
    static let label: CFloat = 0
    static let ball: CGFloat = 1
    static let colorSwitch: CGFloat = 2
}
