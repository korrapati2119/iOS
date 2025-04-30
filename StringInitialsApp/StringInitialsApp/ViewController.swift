//
//  ViewController.swift
//  StringInitialsApp
//
//  Created by Venkata kishore korrapati on 1/30/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var finputOL: UITextField!
    
    @IBOutlet weak var linputOL: UITextField!
    
    @IBOutlet weak var outputOL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBTN(_ sender: Any) {
        // read fname and store it in var variable
        var fname = finputOL.text!
        // read lname and store it in var variable
        var lname = linputOL.text!
        // we need to get first letter of firstname and first lette of lastname
        var firstInitial = fname.prefix(1).uppercased()
        var lastInitial = lname.prefix(1).uppercased()
        // display the result in outputol
        
        outputOL.text = "initials are : \(firstInitial). \(lastInitial)"
    }
    
}

