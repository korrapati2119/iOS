//
//  ResultViewController.swift
//  MVC
//
//  Created by Venkata kishore korrapati on 3/22/25.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var EnteredAmountOL: UILabel!
    
    
    @IBOutlet weak var DiscountAmountOL: UILabel!
    
    
    @IBOutlet weak var PriceAfterDiscountOL: UILabel!
    
    var amount = ""
    var discount  = ""
    var priceAfterDiscount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnteredAmountOL.text! = EnteredAmountOL.text! + amount
        DiscountAmountOL.text! = DiscountAmountOL.text! + discount
        PriceAfterDiscountOL.text! = PriceAfterDiscountOL.text! + priceAfterDiscount
        
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
