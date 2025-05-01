//
//  forgotpasswordViewController.swift
//  Travel Buddy App
//
//  Created by Durga Ramdas Raja on 4/2/25.
//

import UIKit

class forgotpasswordViewController: UIViewController {

    @IBOutlet weak var emailOL: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resetBTN(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToEmailSentView" {
                // Get the destination view controller
                if let destinationVC = segue.destination as? EmailSentViewController {
                    // Pass the email to the EmailSentViewController
                    destinationVC.receivedEmail = emailOL.text
                }
            }
        }
    }

