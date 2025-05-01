//
//  homepageViewController.swift
//  Travel Buddy App
//
//  Created by Durga Ramdas Raja on 4/2/25.
//

import UIKit
import FirebaseAuth

class homepageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Auth.auth().currentUser == nil {
            // No user is logged in, redirect to login
            redirectToLogin()
        }
    }

    func redirectToLogin() {
        // Replace with your login screen identifier
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") {
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
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
