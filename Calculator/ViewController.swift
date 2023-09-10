//
//  ViewController.swift
//  Calculator
//
//  Created by Илья Морин on 10.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen: Double = 0
    var firstNum: Double = 0
    var operation: Int = 0
    var mathSign: Bool = false
    
    @IBOutlet var currentOperation: UILabel!
    
    @IBOutlet var result: UILabel!
    
    @IBAction func funcButtons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            switch sender.tag {
            case 11: // Деление
                result.text = "/"
            case 12: // Умножение
                result.text = "x"
            case 13: // Вычитание
                result.text = "-"
            case 14: // Сложение
                result.text = "+"
            default:
                break
            }
            operation = sender.tag
            mathSign = true
        }
        else if sender.tag == 15 { // Посчитать все
            switch operation {
            case 11:
                result.text = String(firstNum / numberFromScreen)
                currentOperation.text = result.text
            case 12:
                result.text = String(firstNum * numberFromScreen)
                currentOperation.text = result.text
            case 13:
                result.text = String(firstNum - numberFromScreen)
                currentOperation.text = result.text
            case 14:
                result.text = String(firstNum + numberFromScreen)
                currentOperation.text = result.text
            default:
                break
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            currentOperation.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
    }
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func percent(_ sender: UIButton) {
        if result.text != "" {
            let num = Double(result.text!)!
            let percentage = num * (firstNum / 100)
            result.text = String(percentage)
            numberFromScreen = percentage
        }
    }
    
    @IBAction func plusMinus(_ sender: UIButton) {
        if result.text != "" {
            let num = Double(result.text!)!
            result.text = String(num * -1)
            numberFromScreen = Double(result.text!)!
        }
    }
    
    @IBAction func decimalPoint(_ sender: UIButton) {
        if !result.text!.contains(".") {
            result.text = result.text! + "."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for case let button as UIButton in self.view.subviews {
            button.layer.cornerRadius = button.frame.size.height/2
        }
    }
}

