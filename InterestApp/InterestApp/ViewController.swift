//
//  ViewController.swift
//  InterestApp
//
//  Created by Venkata kishore korrapati on 3/27/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PrincipalAmountOL: UITextField!
    
    @IBOutlet weak var RateofInterestOL: UITextField!
    
    @IBOutlet weak var TimeOL: UITextField!
    
    var principal: Double = 0.0
        var rate: Double = 0.0
        var time: Double = 0.0
        var simpleInterest: Double = 0.0
        var categoryName = ""
        var adviceMessage = ""
        var imgname = ""
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        @IBAction func CalcBtn(_ sender: Any) {
            principal = Double(PrincipalAmountOL.text!)!
                    rate = Double(RateofInterestOL.text!)!
                    time = Double(TimeOL.text!)!
                    simpleInterest = (principal * rate * time) / 100
                    
                    if simpleInterest <= 100 {
                        categoryName = "Low Interest"
                        adviceMessage = "Consider investing in higher returns."
                        imgname = "lowInterestImage"
                    } else if simpleInterest <= 500 {
                        categoryName = "Moderate Interest"
                        adviceMessage = "You're earning a reasonable amount."
                        imgname = "mediumInterestImage"
                    } else {
                        categoryName = "High Interest"
                        adviceMessage = "Great! Your investment is growing well."
                        imgname = "highInterestImage"
                    }
                }
                
                override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    if segue.identifier == "ResultSegue" {
                        let destination = segue.destination as! ResultViewController
                        
                        destination.enteredPrincipal = principal
                        destination.enteredRate = rate
                        destination.enteredTime = time
                        destination.calculatedInterest = simpleInterest
                        destination.interestCategory = categoryName
                        destination.adviceMessage = adviceMessage
                        destination.interestImageName = imgname
                    }
        }
    
}
