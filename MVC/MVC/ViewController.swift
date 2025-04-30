//
//  ViewController.swift
//  MVC
//
//  Created by Venkata kishore korrapati on 3/21/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AmountOL: UITextField!
    
    @IBOutlet weak var DiscountOL: UITextField!
    
    var priceAfterDiscount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func CalculateBtn(_ sender: Any) {
        //read amount from user
        var amount = Double(AmountOL.text!)
        //read discount amount from user
        var discount = Double(DiscountOL.text!)
        //calculate discount and assign it to price after discount
        priceAfterDiscount = amount! - (amount! * discount!/100)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier!
        if transition == "ResultSegue"{
            //create destination
            var destination = segue.destination as!
            ResultViewController
            
            destination.amount = AmountOL.text!
            destination.discount = DiscountOL.text!
            destination.priceAfterDiscount = String(priceAfterDiscount)
        }
    }
}

