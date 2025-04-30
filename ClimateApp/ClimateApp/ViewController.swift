//
//  ViewController.swift
//  ClimateApp
//
//  Created by Venkata kishore korrapati on 1/24/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var displayOL: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtn(_ sender: Any) {
        var string = inputOL.text!
        var temp = Double(string)!
        if temp >= 60 {
            imageOL.image = UIImage(named: "hot")
            displayOL.text = "HOT 🔥"
        }
        else{
            imageOL.image = UIImage(named: "Cool")
            displayOL.text = "Cool 🥶"
        }
    }
    
}

