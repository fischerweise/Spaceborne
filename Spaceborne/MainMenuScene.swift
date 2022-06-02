//
//  MainMenuScene.swift
//  Spaceborne
//
//  Created by Mustafa Pekdemir on 2.06.2022.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "mainBackground")
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameBy = SKLabelNode(fontNamed: "Rockwell-Bold")
        gameBy.text = "fischerweise PRESENTS"
        gameBy.fontSize = 50
        gameBy.fontColor = SKColor.white
        gameBy.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.78)
        gameBy.zPosition = 1
        self.addChild(gameBy)
        
        let gameName = SKLabelNode(fontNamed: "Rockwell-Bold")
        gameName.text = "SPACE"
        gameName.fontSize = 200
        gameName.fontColor = SKColor.white
        gameName.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.575)
        gameName.zPosition = 1
        self.addChild(gameName)
        
        let gameName2 = SKLabelNode(fontNamed: "Rockwell-Bold")
        gameName2.text = "BORNE"
        gameName2.fontSize = 200
        gameName2.fontColor = SKColor.white
        gameName2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.475)
        gameName2.zPosition = 1
        self.addChild(gameName2)
        
        let startGame = SKLabelNode(fontNamed: "Rockwell-Bold")
        startGame.text = "START GAME"
        startGame.fontSize = 100
        startGame.fontColor = SKColor.green
        startGame.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.3)
        startGame.zPosition = 1
        startGame.name = "startButton"
        self.addChild(startGame)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let nodeTapped = atPoint(pointOfTouch)
            if nodeTapped.name == "startButton" {
                let sceneMoveTo = GameScene(size: self.size)
                let mainTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneMoveTo, transition: mainTransition)
            }
        }
    }
}
