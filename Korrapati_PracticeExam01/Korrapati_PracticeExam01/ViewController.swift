//
//  ViewController.swift
//  Korrapati_PracticeExam01
//
//  Created by Venkata kishore korrapati on 2/20/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var heightInFtOutlet: UITextField!
    
    @IBOutlet weak var heightInInchesOutlet: UITextField!
    
    @IBOutlet weak var weightOutlet: UITextField!
    
    @IBOutlet weak var displayOutlet: UILabel!
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcBtn(_ sender: Any) {
        // Get input values
                let feetText = heightInFtOutlet.text ?? "0"
                let inchesText = heightInInchesOutlet.text ?? "0"
                let weightText = weightOutlet.text ?? "0"
                
                if let feet = Int(feetText), let inches = Int(inchesText), let weight = Double(weightText) {
                            let totalInches = (feet * 12) + inches

                            if totalInches <= 0 || weight <= 0 {
                                displayOutlet.text = "Enter valid height and weight."
                                return
                            }

                            let bmi = round((703 * weight) / Double(totalInches * totalInches) * 10) / 10.0

                            var message = "Your Body Mass Index is \(bmi)."
                            var imageName = ""

                            if bmi <= 18.5 {
                                message += "\nYou are Underweight.\nHealth tip: Eat more protein and healthy fats."
                                imageName = "underWeight.jpeg"
                            } else if bmi <= 24.9 {
                                message += "\nYou have a Normal weight.\nHealth tip: Excellent! Maintain a balanced lifestyle."
                                imageName = "normal.jpeg"
                            } else if bmi <= 29.9 {
                                message += "\nYou are Overweight.\nHealth tip: Maintain a balanced diet and exercise more."
                                imageName = "overWeight.jpeg"
                            } else {
                                message += "\nYou are Obese.\nHealth tip: Consult a doctor for advice."
                                imageName = "obese.jpeg"
                            }

                            displayOutlet.text = message
                            imageViewOutlet.image = UIImage(named: imageName)
                        } else {
                            displayOutlet.text = "Enter valid height and weight."
                        }
        
    }
}
