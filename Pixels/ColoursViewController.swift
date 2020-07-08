//
//  ColoursViewController.swift
//  Pixels
//
//  Created by Samuel Miller on 08/07/2020.
//

import UIKit

class ColoursViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOne.backgroundColor = Global.data.colours[0]
        buttonTwo.backgroundColor = Global.data.colours[1]
        buttonThree.backgroundColor = Global.data.colours[2]
        buttonFour.backgroundColor = Global.data.colours[3]
        buttonFive.backgroundColor = Global.data.colours[4]
        buttonSix.backgroundColor = Global.data.colours[5]
        buttonSeven.backgroundColor = Global.data.colours[6]
        buttonEight.backgroundColor = Global.data.colours[7]
        buttonNine.backgroundColor = Global.data.colours[8]
        buttonTen.backgroundColor = Global.data.colours[9]
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonTen: UIButton!
    
    @IBAction func buttonOnePressed(_ sender: Any) {
        Global.data.selectedColour = buttonOne.backgroundColor!
    }
    @IBAction func buttonTwoPressed(_ sender: Any) {
        Global.data.selectedColour = buttonTwo.backgroundColor!
    }
    @IBAction func buttonThreePressed(_ sender: Any) {
        Global.data.selectedColour = buttonThree.backgroundColor!
    }
    @IBAction func buttonFourPressed(_ sender: Any) {
        Global.data.selectedColour = buttonFour.backgroundColor!
    }
    @IBAction func buttonFivePressed(_ sender: Any) {
        Global.data.selectedColour = buttonFive.backgroundColor!
    }
    @IBAction func buttonSixPressed(_ sender: Any) {
        Global.data.selectedColour = buttonSix.backgroundColor!
    }
    @IBAction func buttonSevenPressed(_ sender: Any) {
        Global.data.selectedColour = buttonSeven.backgroundColor!
    }
    @IBAction func buttonEightPressed(_ sender: Any) {
        Global.data.selectedColour = buttonEight.backgroundColor!
    }
    @IBAction func buttonNinePressed(_ sender: Any) {
        Global.data.selectedColour = buttonNine.backgroundColor!
    }
    @IBAction func buttonTenPressed(_ sender: Any) {
        Global.data.selectedColour = buttonTen.backgroundColor!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
