//
//  EmailSentViewController.swift
//  Travel Buddy App
//
//  Created by Venkata kishore korrapati on 4/27/25.
//

import UIKit

class EmailSentViewController: UIViewController {
    
    @IBOutlet weak var emailsentOL: UITextView!
    var receivedEmail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        // Display the received email in the text view
        if let email = receivedEmail {
            emailsentOL.text = "A link to reset your password has been sent to your email address: \(email)"
        }
    }
    
    
    
    @IBAction func backloginBTN(_ sender: Any) {
        if let navigationController = self.navigationController {
            // Instantiate the ViewController (login page)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let viewController = storyboard.instantiateViewController(withIdentifier: "loginpagevc") as? ViewController {
                // Push the ViewController to the navigation stack
                navigationController.pushViewController(viewController, animated: true)
            }
        }
    }
}
