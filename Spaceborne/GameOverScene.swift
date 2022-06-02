//
//  GameOverScene.swift
//  Spaceborne
//
//  Created by Mustafa Pekdemir on 2.06.2022.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    let restartLabel = SKLabelNode(fontNamed: "Rockwell-Bold")
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "mainBackground")
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode(fontNamed: "Rockwell-Bold")
        gameOverLabel.text = "GAME OVER"
        gameOverLabel.fontSize = 120
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.7)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "Rockwell-Bold")
        scoreLabel.text = "SCORE: \(gameScore)"
        scoreLabel.fontSize = 100
        scoreLabel.fontColor = SKColor.yellow
        scoreLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.55)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if gameScore > highScoreNumber {
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
        }
        
        let highScoreLabel = SKLabelNode(fontNamed: "Rockwell-Bold")
        highScoreLabel.text = "HIGH SCORE: \(highScoreNumber)"
        highScoreLabel.fontSize = 100
        highScoreLabel.fontColor = SKColor.red
        highScoreLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.45)
        highScoreLabel.zPosition = 1
        self.addChild(highScoreLabel)
        
        
        restartLabel.text = "RESTART"
        restartLabel.fontSize = 90
        restartLabel.fontColor = SKColor.green
        restartLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.30)
        restartLabel.zPosition = 1
        self.addChild(restartLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            if restartLabel.contains(pointOfTouch) {
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let mainTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: mainTransition)
            }
        }
    }
}
