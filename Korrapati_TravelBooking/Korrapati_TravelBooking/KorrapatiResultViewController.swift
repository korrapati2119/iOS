//
//  KorrapatiResultViewController.swift
//  Korrapati_TravelBooking
//
//  Created by Venkata kishore korrapati on 4/17/25.
//

import UIKit

class KorrapatiResultViewController: UIViewController {

    @IBOutlet weak var imageOL: UIImageView!
    
    @IBOutlet weak var travellerNameOL: UILabel!
    
    @IBOutlet weak var noOfTravellersOL: UILabel!
    
    @IBOutlet weak var cabinTypeOL: UILabel!
    
    @IBOutlet weak var totalCostOL: UILabel!
    
    @IBOutlet weak var resultOL: UILabel!
    
    var travellerName: String = ""
        var noOfTravellers: Int = 0
        var cabinType: String = ""
        var totalCost: Int = 0
        var resultMessage: String = ""
        var imageName: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        travellerNameOL.text = "Traveller Name: \(travellerName)"
                noOfTravellersOL.text = "No of Guests: \(noOfTravellers)"
                cabinTypeOL.text = "Class Type: \(cabinType.capitalized)"
                totalCostOL.text = "Total Cost: $\(totalCost)"
                resultOL.text = resultMessage
                imageOL.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
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
