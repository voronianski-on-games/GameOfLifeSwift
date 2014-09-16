//
//  GameScene.swift
//  GameOfLifeSwift
//
//  Created by Dmitri Voronianski on 07.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var _grid = Grid()
    var _isPaused = false
    var _populationLabel = SKLabelNode()
    var _generationLabel = SKLabelNode()
    var _timer:SKAction?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        let background = SKSpriteNode(imageNamed:"background")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        self.addChild(background)
        
        _grid.anchorPoint = CGPoint(x: 0, y: 0)
        _grid.position = CGPoint(x: size.width - _grid.size.width-10, y: 6)
        self.addChild(_grid)
        
        let microscope = SKSpriteNode(imageNamed:"microscope")
        microscope.anchorPoint = CGPoint(x: 0, y: 0)
        microscope.position = CGPoint(x: 16, y: 10)
        self.addChild(microscope)
        
        let balloon = SKSpriteNode(imageNamed:"balloon")
        balloon.anchorPoint = CGPoint(x: 0.5, y: 0)
        balloon.position = CGPoint(x: balloon.size.width/2 + 3, y: microscope.size.height + 18)
        self.addChild(balloon)
        
        let fontName = "Helvetica Neue Bold"
        let fontSize:CGFloat = 12
        let labelColor = UIColor(red: (35/255.0), green:(116/255.0), blue:(53/255.0), alpha:1)
        
        let populationLabelText:SKLabelNode = SKLabelNode(fontNamed:fontName)
        populationLabelText.text = "Population"
        populationLabelText.fontSize = fontSize
        populationLabelText.fontColor = labelColor
        populationLabelText.position = CGPoint(x: 2, y: 65)
        balloon.addChild(populationLabelText)
        
        _populationLabel.fontName  = fontName
        _populationLabel.text = "0"
        _populationLabel.fontSize = fontSize
        _populationLabel.fontColor = labelColor
        _populationLabel.position = CGPoint(x: 2, y: 50)
        balloon.addChild(_populationLabel)
        
        let generationLabelText:SKLabelNode = SKLabelNode(fontNamed:fontName)
        generationLabelText.text = "Generation"
        generationLabelText.fontSize = fontSize
        generationLabelText.fontColor = labelColor
        generationLabelText.position = CGPoint(x: 2, y: 33)
        balloon.addChild(generationLabelText)
        
        _generationLabel.fontName  = fontName
        _generationLabel.text = "0"
        _generationLabel.fontSize = fontSize
        _generationLabel.fontColor = labelColor
        _generationLabel.position = CGPoint(x: 2, y: 18)
        balloon.addChild(_generationLabel)
    }
    
    func play() {
        if (_isPaused) {
            _isPaused = false
            self.speed = 1
        }
        
        if let timing = _timer {
            return
        }
        
        let wait:SKAction = SKAction.waitForDuration(0.5)
        let performSelector:SKAction = SKAction.runBlock(self.step)
        let sequence:SKAction = SKAction.sequence([performSelector, wait])
        _timer = SKAction.repeatActionForever(sequence)
        self.runAction(_timer)
        
    }
    
    func pause() {
        if (_isPaused) {
            return
        }
        _isPaused = true
        self.speed = 0
    }
    
    func step() {
        _grid.evolveStep()
        _populationLabel.text = "\(_grid.totalAlive)"
        _generationLabel.text = "\(_grid.generation)"
    }
}
