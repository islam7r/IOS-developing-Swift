//
//  ViewController.swift
//  Simple Calculator
//
//  Created by Islam Rzayev on 02.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNumber: UITextField!
    
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func plusClicker(_ sender: Any) {
        
        if let firstInput = Double(firstNumber.text!) {
            if let secondInput = Double(secondNumber.text!) {
                result = firstInput + secondInput
                resultLabel.text = String(result)
            }
        }
        
    }
    
    @IBAction func minusClicker(_ sender: Any) {
        if let firstInput = Double(firstNumber.text!) {
            if let secondInput = Double(secondNumber.text!) {
                result = firstInput - secondInput
                resultLabel.text = String(result)
            }
        }
    }
    
    @IBAction func multiplyClicker(_ sender: Any) {
        if let firstInput = Double(firstNumber.text!) {
            if let secondInput = Double(secondNumber.text!) {
                result = firstInput * secondInput
                resultLabel.text = String(result)
            }
        }
    }
    
    @IBAction func divideClicker(_ sender: Any) {
        if let firstInput = Double(firstNumber.text!) {
            if let secondInput = Double(secondNumber.text!) {
                result = firstInput / secondInput
                resultLabel.text = String(result)
            }
        }
    }
}

