//
//  ViewController.swift
//  mc
//
//  Created by Sanzhar Kozhahmetov on 2/4/17.
//  Copyright © 2017 Sanzhar Kozhahmetov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var triger = false
    var dot = false
    var previousNumber:Double = 0
    var currentNumber:Double = 0
    var operationSign:String = ""
    var numberOnScreen:Double {
        get {
            return Double(lbl.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray [1] == "0" {
                lbl.text = "\(valueArray[0])"
            } else {
                lbl.text = "\(newValue)"
            }
            triger = false
        }
    }
    
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if triger {
            if (lbl.text?.characters.count)!<20 {
                lbl.text = lbl.text! + number
            }
        } else {
            lbl.text = number
            triger = true
        }

    }

    @IBAction func operationPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        previousNumber = numberOnScreen
        triger = false
        dot = false
    }
    
    func operation (operands: (Double,Double) -> Double) {
        numberOnScreen = operands (previousNumber,currentNumber)
        triger = false
    }
    
    @IBAction func equalityPressed(_ sender: UIButton) {
        if triger {
            currentNumber = numberOnScreen
        }
        
        dot = false
        
        switch operationSign {
        case "+": operation {$0+$1}
        case "-": operation {$0-$1}
        case "×": operation {$0*$1}
        case "÷": operation {$0/$1}
        default:break
        }
    }

    @IBAction func clearPressed(_ sender: UIButton) {
        previousNumber = 0
        currentNumber = 0
        numberOnScreen = 0
        lbl.text = "0"
        triger = false
        dot = false
        operationSign = ""
        
    }
    
    @IBAction func plusMinusPressed(_ sender: UIButton) {
        numberOnScreen = -numberOnScreen
    }
    
    @IBAction func procentPressed(_ sender: UIButton) {
        if previousNumber == 0 {
            numberOnScreen = numberOnScreen / 100
        } else {
            currentNumber = previousNumber * numberOnScreen / 100
        }
        
    }
    
    @IBAction func sqrtPressed(_ sender: UIButton) {
        numberOnScreen = sqrt(numberOnScreen)
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if triger && !dot {
            lbl.text = lbl.text! + "."
            dot = true
        } else if !triger && !dot {
            lbl.text = "0."
        }
        
    }
    
    
    
    
}

