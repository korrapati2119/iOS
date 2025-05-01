//
//  BookConfirmViewController.swift
//  Travel Buddy App
//
//  Created by Venkata kishore korrapati on 4/27/25.
//

import UIKit

class BookConfirmViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func homeBTN(_ sender: Any) {
        if let viewControllers = navigationController?.viewControllers {
            for vc in viewControllers {
                if vc is homepageViewController {
                    navigationController?.popToViewController(vc, animated: true)
                    break
                }
            }
        }
    }
    
}
