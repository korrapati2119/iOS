//
//  ResultViewController.swift
//  Korrapati_Exam02
//
//  Created by Venkata kishore korrapati on 4/3/25.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var goalTypeLabel: UILabel!
        @IBOutlet weak var targetAmountLabel: UILabel!
        @IBOutlet weak var interestRateLabel: UILabel!
        @IBOutlet weak var monthlySavingsLabel: UILabel!
        @IBOutlet weak var goalImageView: UIImageView!
        var goalType: String = ""
        var targetAmount: String = ""
        var interestRate: String = ""
        var monthlySavings: String = ""

        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            goalTypeLabel.text = "Goal Type: \(goalType)"
            targetAmountLabel.text = "Target Amount: \(targetAmount)"
            interestRateLabel.text = "Interest Rate: \(interestRate)%"
            monthlySavingsLabel.text = "Monthly Savings: $\(monthlySavings)"
            setGoalImage()
            animateImageView()
        }
        func setGoalImage() {
            switch goalType.lowercased() {
            case "car": goalImageView.image = UIImage(named: "car.jpeg")
            case "vacation": goalImageView.image = UIImage(named: "vacation.jpeg")
            case "home": goalImageView.image = UIImage(named: "home.jpeg")
            default: goalImageView.image = UIImage(named: "default")
            }
        }
        func animateImageView() {
            goalImageView.alpha = 0.0
            UIView.animate(withDuration: 1.5) {
                self.goalImageView.alpha = 1.0
            }
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
