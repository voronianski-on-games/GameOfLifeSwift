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
    var _gridArray = Array<Array<Creature>>()
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
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        let touch:UITouch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        let creature:Creature = self.creatureForTouchPosition(touchLocation)
        creature.isAlive = !creature.isAlive
    }
    
    func creatureForTouchPosition(touchPosition: CGPoint) -> Creature {
        let column = touchPosition.x / _cellWidth
        let row = touchPosition.y / _cellHeight
        let creature:Creature = _gridArray[Int(row)][Int(column)]
        return creature
    }
    
    func setupGrid() {
        _cellWidth = Double(self.size.width) / Double(GRID_COLUMNS)
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
                
                _gridArray[i].insert(creature, atIndex: j)
                
                posX += _cellWidth
            }
            
            posY += _cellHeight
        }
    }
    
    /*
     * GAME OF LIFE RULES
     *
     * If it has 0-1 live neighbors the Creature on that cell dies or stays dead.
     * If it has 2-3 live neighbors it stays alive.
     * If it has 4 or more, it stays dead or dies.
     * If it has exactly 3 neighbors and it is dead, it comes to life!
     */
    
}
