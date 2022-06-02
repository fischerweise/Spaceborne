//
//  GameViewController.swift
//  Spaceborne
//
//  Created by Mustafa Pekdemir on 31.05.2022.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    var backingAudio = AVAudioPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = Bundle.main.path(forResource: "crocket", ofType: "mp3")
        let audioNSURL = URL(fileURLWithPath: filePath!)
        do {
            backingAudio = try AVAudioPlayer(contentsOf: audioNSURL)
        } catch {
            return print("Cannot find the audio")
        }
        backingAudio.numberOfLoops = -1
        backingAudio.play()
        
        let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))

        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
