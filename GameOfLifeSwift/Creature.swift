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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience override init() {
        self.init(imageNamed:"bubble")
        self.hidden = true
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
}
