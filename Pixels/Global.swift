//
//  Global.swift
//  Pixels
//
//  Created by Samuel Miller on 08/07/2020.
//

import UIKit

class Global: NSObject {
    
    var grid: Array<Array<Int>> = [[0,2,3,4,5],
                                   [6,1,3,7,2],
                                   [9,4,8,3,4],
                                   [6,1,3,7,2]]
    
    var colours: Array<UIColor> = [.red,.green,.blue,.yellow,.purple,.black,.gray,.brown,.cyan,.orange]
    
    var cameraPos: CGPoint = CGPoint.zero
    
    var selectedColour: UIColor = .red
    
    static let data = Global()
}
