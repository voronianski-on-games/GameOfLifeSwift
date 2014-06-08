//
//  Creature.swift
//  GameOfLifeSwift
//
//  Created by Dmitri Voronianski on 07.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import SpriteKit

class Creature: SKSpriteNode {
    var isAlive:Bool = false {
        didSet {
            self.hidden = !isAlive
        }
    }
    var livingNeighbours:Int = 0
    
    init() {
        super.init(imageNamed:"bubble")
        self.hidden = true
    }
    
    init(texture: SKTexture!) {
        super.init(texture: texture)
    }
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
}
