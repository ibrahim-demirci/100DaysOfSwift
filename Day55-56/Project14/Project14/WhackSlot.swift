//
//  WhackSlot.swift
//  Project14
//
//  Created by İbrahim Demirci on 20.02.2022.
//

import UIKit
import SpriteKit

class WhackSlot: SKNode {
    
    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
    }
}
