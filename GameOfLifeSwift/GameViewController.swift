//
//  GameViewController.swift
//  GameOfLifeSwift
//
//  Created by Dmitri Voronianski on 07.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the view.
        let skView = self.view as SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
            
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        let scene:GameScene = GameScene.sceneWithSize(skView.bounds.size)
        scene.scaleMode = .ResizeFill
            
        skView.presentScene(scene)
            
        let playButton:UIButton = UIButton(frame: CGRectMake(10, 10, 70, 38))
        playButton.setImage(UIImage(named: "play"), forState: UIControlState.Normal)
        playButton.setImage(UIImage(named: "play-pressed"), forState: UIControlState.Highlighted)
        playButton.addTarget(scene, action:"play", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(playButton)
            
        let pauseButton:UIButton = UIButton(frame: CGRectMake(10, 58, 70, 38))
        pauseButton.setImage(UIImage(named: "pause"), forState: UIControlState.Normal)
        pauseButton.setImage(UIImage(named: "pause-pressed"), forState: UIControlState.Highlighted)
        pauseButton.addTarget(scene, action:"pause", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(pauseButton)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.toRaw())
        } else {
            return Int(UIInterfaceOrientationMask.All.toRaw())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}
