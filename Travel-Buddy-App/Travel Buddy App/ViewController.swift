//
//  ViewController.swift
//  Travel Buddy App
//
//  Created by Durga Ramdas Raja on 4/2/25.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var forgotpasswordOL: UILabel!
    @IBOutlet weak var logoOL: UIImageView!
    
    @IBOutlet weak var usernameOL: UITextField!
    
    @IBOutlet weak var passwordOL: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        
        // Setting up the "Forgot password?" label with an underline and color
        let text = "Forgot password?"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        forgotpasswordOL.attributedText = attributedString
        forgotpasswordOL.isUserInteractionEnabled = true
        forgotpasswordOL.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigateToNextScreen)))
        
        // Setting up the logo image
        logoOL.image = UIImage(named: "logo.png")
        
    }
               
               // Left menu button
               

        // Action method for the settings button
        
    
    // Navigates to the forgot password screen
    @objc func navigateToNextScreen() {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "forgotpasswordvc") {
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }

    
    @IBAction func loginTapped(_ sender: Any) {
        let email = usernameOL.text
        let password = passwordOL.text

        if let email = email, !email.isEmpty, let password = password, !password.isEmpty {
            // Attempt login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    // Show alert on login failure
                    self.showAlert(title: "Login Failed", message: error.localizedDescription)
                    return
                }

                // Login successful
                if let _ = authResult?.user {
                    print("Login successful for: \(email)")
                    self.navigateToHomeScreen()
                }
            }
        } else {
            // Show alert if fields are empty
            showAlert(title: "Missing Info", message: "Please enter both email and password.")
        }
    }

    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

    func navigateToHomeScreen() {
        if let homeVC = storyboard?.instantiateViewController(withIdentifier: "homepageViewController") {
            navigationController?.pushViewController(homeVC, animated: true)
        }
    }

    
}
