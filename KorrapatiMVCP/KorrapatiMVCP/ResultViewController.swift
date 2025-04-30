//
//  ResultViewController.swift
//  KorrapatiMVCP
//
//  Created by Venkata kishore korrapati on 3/31/25.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var EnteredHfeetOL: UILabel!
    
    @IBOutlet weak var EnteredHInchesOL: UILabel!
    
    @IBOutlet weak var EnteredWLbsOL: UILabel!
    
    @IBOutlet weak var ResultLabelOL: UILabel!
    
    @IBOutlet weak var ImageViewOl: UIImageView!
    
    var enteredhfeet = 0
    var enteredhinches = 0
    var enteredwlbs = 0.0
    var bmiResult = 0.0
    var bmiImageName = ""
    var healthMessage = ""
    var categoryMessage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EnteredHfeetOL.text = "Entered Height In Feets:\(enteredhfeet)"
            EnteredHInchesOL.text = "Entered Height In Inches:\(enteredhinches)"
            EnteredWLbsOL.text = "Entered Weight In LBs:\(enteredwlbs)"
            ResultLabelOL.text = "BMI: \(bmiResult)\nCategory: \(categoryMessage)\nHealth Tip: \(healthMessage)"
            ImageViewOl.image = UIImage(named: bmiImageName)
        // Do any additional setup after loading the view.
        ImageViewOl.alpha = 0.0
        UIView.animate(withDuration: 1.2,animations: {
            self.ImageViewOl.alpha = 1.0 })
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
