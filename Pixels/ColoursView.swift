//
//  ColoursView.swift
//  Pixels
//
//  Created by Samuel Miller on 08/07/2020.
//

import UIKit

class ColoursView: UIView {

    @IBAction func buttonOnePressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[0]
    }
    @IBAction func buttonTwoPressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[1]
    }
    @IBAction func buttonThreePressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[2]
    }
    @IBAction func buttonFourPressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[3]
    }
    @IBAction func buttonFivePressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[4]
    }
    @IBAction func buttonSixPressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[5]
    }
    @IBAction func buttonSevenPressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[6]
    }
    @IBAction func buttonEightPressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[7]
    }
    @IBAction func buttonNinePressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[8]
    }
    @IBAction func buttonTenPressed(_ sender: Any) {
        Global.data.selectedColour = Global.data.colours[9]
    }
    
}
