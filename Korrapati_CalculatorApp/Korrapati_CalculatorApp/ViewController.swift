//
//  ViewController.swift
//  Korrapati_CalculatorApp
//
//  Created by Venkata kishore korrapati on 2/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultOutlet: UILabel!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonSubtract: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonModulus: UIButton!
    
    
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var signChange: UIButton!
    @IBOutlet weak var buttonDecimal: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonAllClear: UIButton!
    
    // input to read current and previous inputs from user
    var currInput = ""
    var prevInput = ""
    
    // entered operator needs to be stored
    var selectedOperator: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultOutlet.text = "0"
    }
    
    
    @IBAction func numberEntered(_ sender: UIButton) {
        if let number = sender.titleLabel?.text {
                // Append the number or operator to currInput and update the result
                currInput += number
                resultOutlet.text = "\(prevInput) \(selectedOperator ?? "") \(currInput)"
            }
    }
    
    @IBAction func operatorEntered(_ sender: UIButton) {
        if let operatorType = sender.titleLabel?.text {
                // Ensure the current input is valid before switching operators
                if !currInput.isEmpty {
                    // Save current input as previous input
                    prevInput = currInput
                    currInput = ""
                    selectedOperator = operatorType
                    
                    // Display the operator in the result label
                    resultOutlet.text = "\(prevInput) \(operatorType) \(currInput)"
                }
            }
    }
    
    @IBAction func equalClicked(_ sender: UIButton){
        // Check if both prevInput and currInput are valid and non-empty
        if let prevNum = Double(prevInput), let currNum = Double(currInput), let operatorType = selectedOperator {
            var result: Double = 0
                switch operatorType {
                case "*":
                    result = prevNum * currNum
                case "/":
                    if currNum != 0 {
                        result = prevNum / currNum
                    } else {
                        resultOutlet.text = "Not a number(nan)"
                        return
                    }
                case "%":
                    result = prevNum.truncatingRemainder(dividingBy: currNum)
                case "+":
                    result = prevNum + currNum
                case "-":
                    result = prevNum - currNum
                default:
                    resultOutlet.text = "Error: Invalid Operation"
                    return
                }
            // Display the result
            if result == floor(result) {
                resultOutlet.text = "\(Int(result))"
            } else {
                // If either prevInput or currInput are invalid (empty or non-numeric), show an error
                resultOutlet.text = String(format: "%.10g",result)
            }
        } else{
            resultOutlet.text = "Error: Invalid format"
        }
    }
    @IBAction func allClear(_ sender: UIButton) {
        // when the user clicked ac all input data and results need to be cleared
        prevInput = ""
        currInput = ""
        selectedOperator = nil
        resultOutlet.text = "0"
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        // When "C" button is clicked, remove the last character (operand or operator)
            if !currInput.isEmpty {
                currInput.removeLast()  // Remove last character of current input
                resultOutlet.text = "\(prevInput) \(selectedOperator ?? "") \(currInput)" // Update result label with the remaining expression
            } else if !prevInput.isEmpty && selectedOperator != nil {
                // If the current input is empty but previous input and selected operator exist,
                // clear the operator and update the result with the previous operand
                selectedOperator = nil
                resultOutlet.text = "\(prevInput)"
            }
    }
    @IBAction func decimalBtn(_ sender: UIButton){
        // check for decimal before appending to result
        if !currInput.contains("."){
            currInput += "."
            if let operatorType = selectedOperator {
                            resultOutlet.text = "\(prevInput) \(operatorType ?? "") \(currInput)"
                        } else {
                            resultOutlet.text = "\(currInput)"
          }
        }
    }
    
    @IBAction func signChange(_ sender: UIButton){
        // when sign change button is clicked current number needs to be changed
        if let currentNumber = Double(currInput) {
            currInput = "\(currentNumber * -1)"
            if let operatorType = selectedOperator {
                resultOutlet.text = "\(prevInput) \(operatorType ?? "") \(currInput)"
            } else {
                resultOutlet.text = "\(currInput)"
            }
        }
    }
}
    
