//
//  ConfirmationViewController.swift
//  Travel Buddy App
//
//  Created by Venkata kishore korrapati on 4/17/25.
//

import UIKit

class ConfirmationViewController: UIViewController {

    
    @IBOutlet weak var confirmationOL: UILabel!
    var confirmationMessage: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        confirmationOL.text = "Your ride request is in consideration. We'll notify you shortly 🤩"
        // Do any additional setup after loading the view.
    }
    @IBAction func backToSecondTapped(_ sender: UIButton) {
        if let viewControllers = navigationController?.viewControllers {
            for vc in viewControllers {
                if vc is homepageViewController {
                    navigationController?.popToViewController(vc, animated: true)
                    break
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
