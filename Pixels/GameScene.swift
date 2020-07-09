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
        loadPixels()
        
    }
    
    
    func loadPixels() {
        for i in self.children {
            if i.name != nil {
                if i.name!.contains("pixel") {
                    i.delete(self)
                }
            }
            
        }
        for i in Global.data.pixels {
            let node = SKSpriteNode()
            //node.name = "pixel"+String(describing: i.id!)
            node.color = Global.data.colours[i.colour!]
            node.size.width = 1
            node.size.height = 1
            node.position = CGPoint(x: i.column!, y: i.row!)
            node.anchorPoint = CGPoint(x: 0, y: 0)
            node.isUserInteractionEnabled = false
            self.addChild(node)
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
            if let pixel = self.nodes(at: (touch.location(in: self))).first as? SKSpriteNode {
                for i in Global.data.pixels {
                    if i.row! == Int(pixel.position.y) && i.column! == Int(pixel.position.x) {
                        i.colour = Global.data.colours.firstIndex(of: Global.data.selectedColour)
                        loadPixels()
                    }
                }
            }
        }
        
        loadPixels()
        
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
