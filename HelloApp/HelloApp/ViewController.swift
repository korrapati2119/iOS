//
//  ViewController.swift
//  HelloApp
//
//  Created by Venkata kishore korrapati on 1/24/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputOL: UITextField!
    @IBOutlet weak var displayOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        var name = inputOL.text!
        displayOL.text = "Hello \(name)"
    }
    

}

