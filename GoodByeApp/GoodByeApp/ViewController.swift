//
//  ViewController.swift
//  GoodByeApp
//
//  Created by Venkata kishore korrapati on 1/24/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var finputOL: UITextField!
    
    @IBOutlet weak var linputOL: UITextField!
    
    @IBOutlet weak var displayOL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtn(_ sender: Any) {
        var fname = finputOL.text!
        var lname = linputOL.text!
        displayOL.text! = "GoodBye!☺️ \(fname) \(lname)"
    }
    
}

