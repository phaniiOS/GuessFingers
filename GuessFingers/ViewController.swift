//
//  ViewController.swift
//  GuessFingers
//
//  Created by IMCS2 on 2/6/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var QLabel: UILabel!
    
    @IBOutlet weak var UserInput: UITextField!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBAction func CheckButton(_ sender: Any) {
        let a = UserInput.text
        var bFlag = false
        for i in (a?.unicodeScalars)!{
            if !(i.value > 48 || i.value < 57 || i.value == 45 || i.value == 43){//48-57 are 0-9 and 45 is -, 43 is +
                let alert = UIAlertController(title: "Error in Input", message: "Input should only contain numbers", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                ResultLabel.text = "Error in input, non-numeric values are in input."
                bFlag = true
                break
            }
        }
        if(bFlag != true){//enters only if input is numeric
             let aNum = Int(a!)
            if aNum! < 0 || aNum! > 10{
//                    throw myException
                let alert = UIAlertController(title: "Error in Input", message: "Input should be in the range of 0 and 10", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                ResultLabel.text = "Error in input, not in the range of 0-10"
            }
            else{// enter only if the number is in the range 0-10
                let num = Int.random(in: 0...10)
                if UserInput.text == String(num)
                {
                    ResultLabel.text = "Result: Correct Guess!!!!!"
                }
                else{
                    ResultLabel.text = "Result: Wrong guess, correct number is \(num)"
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

