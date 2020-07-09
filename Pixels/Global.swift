//
//  Global.swift
//  Pixels
//
//  Created by Samuel Miller on 08/07/2020.
//

import UIKit

class Global: NSObject {
    
    var pixels: Array<Pixel> = []
    
    var grid: Array<Array<Int>> = [[],
                                   []]
    
    var colours: Array<UIColor> = [.red,.green,.blue,.yellow,.purple,.black,.gray,.white,.cyan,.orange]
    
    var cameraPos: CGPoint = CGPoint.zero
    
    var selectedColour: UIColor = .red
    
    static let data = Global()
}
