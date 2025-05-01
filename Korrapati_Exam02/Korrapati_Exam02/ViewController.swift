//
//  ViewController.swift
//  Korrapati_Exam02
//
//  Created by Venkata kishore korrapati on 4/3/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goalTypeTextField: UITextField!
       @IBOutlet weak var targetAmountTextField: UITextField!
       @IBOutlet weak var interestRateTextField: UITextField!
       @IBOutlet weak var timePeriodTextField: UITextField!
       @IBOutlet weak var calculateButton: UIButton!
       @IBOutlet weak var resetButton: UIButton!
           
       
       var totalMonths: Double = 0.0
       var monthlyInterestRate: Double = 0.0
       var monthlySavingsPayment: Double = 0.0
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           goalTypeTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
                   targetAmountTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
                   interestRateTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
                   timePeriodTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
                   
                   calculateButton.isEnabled = false
                   resetButton.isEnabled = false
       }
       override func viewWillAppear(_ animated: Bool) {
               super.viewWillAppear(animated)
               
               // Reset all input fields
           goalTypeTextField.text = ""
           targetAmountTextField.text = ""
           interestRateTextField.text = ""
           timePeriodTextField.text = ""
              
           }
       @IBAction func calculateSavings(_ sender: UIButton) {
           guard let targetAmount = Double(targetAmountTextField.text!),
                 let interestRate = Double(interestRateTextField.text!),
                 let timePeriod = Double(timePeriodTextField.text!) else {
               showAlert(message: "Please enter valid values for all fields.")
               return
           }
           
           totalMonths = timePeriod * 12
           monthlyInterestRate = (interestRate / 100) / 12
           
           if monthlyInterestRate == 0 {
               monthlySavingsPayment = targetAmount / totalMonths
           } else {
               monthlySavingsPayment = targetAmount / ((pow(1 + monthlyInterestRate, totalMonths) - 1) / monthlyInterestRate)
           }
       }
       
       @IBAction func resetFields(_ sender: UIButton) {
           goalTypeTextField.text = ""
           targetAmountTextField.text = ""
           interestRateTextField.text = ""
           timePeriodTextField.text = ""
       }
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ResultSegue" {
               let destinationVC = segue.destination as! ResultViewController
               destinationVC.goalType = goalTypeTextField.text!
               destinationVC.targetAmount = targetAmountTextField.text!
               destinationVC.interestRate = interestRateTextField.text!
               destinationVC.monthlySavings = String(format: "%.2f", monthlySavingsPayment)
           }
       }
       @objc func textFieldDidChange(_ textField: UITextField) {
               if let goalType = goalTypeTextField.text, !goalType.isEmpty,
                  let targetAmount = targetAmountTextField.text, !targetAmount.isEmpty,
                  let interestRate = interestRateTextField.text, !interestRate.isEmpty,
                  let timePeriod = timePeriodTextField.text, !timePeriod.isEmpty {
                   calculateButton.isEnabled = true
                   resetButton.isEnabled = true
               } else {
                   calculateButton.isEnabled = false
                   resetButton.isEnabled = false
               }
           }
       
       func showAlert(message: String) {
           let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           present(alert, animated: true)
       }

   }

