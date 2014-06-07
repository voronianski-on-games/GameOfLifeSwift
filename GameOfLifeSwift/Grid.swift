//
//  Grid.swift
//  GameOfLifeSwift
//
//  Created by Dmitri Voronianski on 07.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit
import SpriteKit

let GRID_ROWS = 8
let GRID_COLUMNS = 10

class Grid: SKSpriteNode {
    var _gridArray:AnyObject[] = []
    var _cellWidth:Double = 0
    var _cellHeight:Double = 0
    
    init() {
        super.init(imageNamed:"grid")
        self.userInteractionEnabled = true
        self.setupGrid()
    }
    
    init(texture: SKTexture!) {
        super.init(texture: texture)
    }
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    func setupGrid() {
        _cellWidth = Double(self.size.width) / Double(GRID_ROWS)
        _cellHeight = Double(self.size.height) / Double(GRID_ROWS)
        
        var posX:Double = 0;
        var posY:Double = 0;
        
        for (var i = 0; i < GRID_ROWS; i++) {
            _gridArray.insert([], atIndex: i)
            
            posX = 0 // start of every row
            
            for (var j = 0; j < GRID_COLUMNS; j++) {
                let creature = Creature()
                creature.anchorPoint = CGPoint(x: 0, y: 0)
                creature.position = CGPoint(x: Int(posX), y: Int(posY))
                creature.isAlive = true
                self.addChild(creature)
                
                //_gridArray[i].insert(creature, atIndex: j)
                
                posX += _cellWidth
            }
            
            posY += _cellHeight
        }
    }
    
}
