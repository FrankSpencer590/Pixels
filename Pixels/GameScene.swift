//
//  GameScene.swift
//  Pixels
//
//  Created by Samuel Miller on 08/07/2020.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let panRec = UIPanGestureRecognizer()
    var previousPan:CGPoint = CGPoint.zero
    var previousCameraScale = CGFloat()
    

    
    override func sceneDidLoad() {
        self.backgroundColor = .black
        var column = 0
        var row = 0
        for i in Global.data.grid {
            row = 0
            for value in i {
                //print(String(describing: column)+","+String(describing: row)+": "+String(describing: Global.data.colours[value].accessibilityName))
                
                let node = SKSpriteNode()
                node.color = Global.data.colours[value]
                node.size.width = 1
                node.size.height = 1
                node.position = CGPoint(x: row, y: column)
                node.anchorPoint = CGPoint(x: 0, y: 0)
                node.isUserInteractionEnabled = false
                self.addChild(node)
                row += 1
            }
            
            column += 1
        }
        
    }
    
    override func didMove(to view: SKView) {
        self.camera = (self.childNode(withName: "camera") as! SKCameraNode)
        let pinchGesture = UIPinchGestureRecognizer()
        pinchGesture.addTarget(self, action: #selector(pinchGestureAction(_:)))
        view.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinchGestureAction(_ sender: UIPinchGestureRecognizer) {
        guard let camera = self.camera else {
          return
        }
        if sender.state == .began {
          previousCameraScale = camera.xScale
        }
        camera.setScale(previousCameraScale * 1 / sender.scale)
      }
    
    func distanceBetween(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
          return
        }
        let location = touch.location(in: self)
        let previousLocation = touch.previousLocation(in: self)

        camera?.position.x -= location.x - previousLocation.x
        camera?.position.y -= location.y - previousLocation.y
        
        
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        let previousLocation = touch.previousLocation(in: self)
        
        if distanceBetween(location, previousLocation) == 0.0 {
            if let square = self.nodes(at: (touch.location(in: self))).first as? SKSpriteNode {
                square.color = Global.data.selectedColour
            }
        }
        
        
        
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
