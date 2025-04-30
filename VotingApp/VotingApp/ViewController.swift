//
//  ViewController.swift
//  VotingApp
//
//  Created by Venkata kishore korrapati on 1/25/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageOL: UITextField!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    @IBOutlet weak var displayOL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkBtn(_ sender: Any) {
        var string = ageOL.text!
        var age = Int(string)!
        if age >= 18 {
            imageOL.image = UIImage(named: "validvote")
            displayOL.text = "Eligible To Vote🗳️"
        }
        else {
            imageOL.image = UIImage(named: "invalidvote")
            displayOL.text = "Not Eligible To Vote❌"
        }
    }
    
}

