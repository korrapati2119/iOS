//
//  ViewController.swift
//  VowelApp
//
//  Created by Venkata kishore korrapati on 1/28/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var displayOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkBtn(_ sender: Any) {
        let c = inputOL.text!
        if c == "a" || c == "e" || c == "i" || c == "o" || c == "u"
        {
            displayOL.text = "\(c) is a vowel"
        }
        else
        {
            displayOL.text = "\(c) is not a vowel"
            
        }
    }
    }

