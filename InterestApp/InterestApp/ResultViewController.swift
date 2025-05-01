//
//  ResultViewController.swift
//  InterestApp
//
//  Created by Venkata kishore korrapati on 3/27/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var EnteredAmountOL: UILabel!
    @IBOutlet weak var EnteredInterestOL: UILabel!
    @IBOutlet weak var EnteredTimeOL: UILabel!
    @IBOutlet weak var OutputOL: UILabel!
    @IBOutlet weak var ImageViewOL: UIImageView!
        var enteredPrincipal = 0.0
        var enteredRate = 0.0
        var enteredTime = 0.0
        var calculatedInterest = 0.0
        var interestCategory = ""
        var adviceMessage = ""
        var interestImageName = ""
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            EnteredAmountOL.text = "Principal: $\(enteredPrincipal)"
            EnteredInterestOL.text = "Rate: \(enteredRate)%"
            EnteredTimeOL.text = "Time: \(enteredTime) years"
            OutputOL.text = """
            Simple Interest: $\(calculatedInterest)
            Category: \(interestCategory)
            Advice: \(adviceMessage)
            """
            ImageViewOL.image = UIImage(named: interestImageName)
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
