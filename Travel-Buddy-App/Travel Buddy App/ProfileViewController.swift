//
//  ProfileViewController.swift
//  Travel Buddy App
//
//  Created by Venkata kishore korrapati on 4/17/25.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var firstNameOL: UITextField!
    
    @IBOutlet weak var lastNameOL: UITextField!
    
    @IBOutlet weak var phoneNumberOL: UITextField!
    
    @IBOutlet weak var emailOL: UITextField!
    
   
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        fetchUserProfile()
    }

    func fetchUserProfile() {
        guard let user = Auth.auth().currentUser else { return }
        let uid = user.uid

        ref.child("users").child(uid).observeSingleEvent(of: .value, with: { snapshot in
            if let value = snapshot.value as? [String: Any] {
                self.firstNameOL.text = value["firstName"] as? String
                self.lastNameOL.text = value["lastName"] as? String
                self.emailOL.text = value["email"] as? String
                self.phoneNumberOL.text = value["phoneNumber"] as? String
            }
        })
    }

    @IBAction func updateBtn(_ sender: UIButton) {
        guard let user = Auth.auth().currentUser else { return }
        let uid = user.uid

        let firstName = firstNameOL.text
        let lastName = lastNameOL.text
        let phoneNumber = phoneNumberOL.text
        let email = emailOL.text

        // Validate input
        if firstName == nil || firstName == "" || lastName == nil || lastName == "" {
            showError("First and Last name are required.")
            return
        }

        // Update the user's profile in Firebase
        let updatedData = [
            "firstName": firstName!,
            "lastName": lastName!,
            "email": email!,
            "phoneNumber": phoneNumber ?? ""
        ]

        ref.child("users").child(uid).updateChildValues(updatedData) { (error, ref) in
            if let error = error {
                self.showError("Failed to update profile: \(error.localizedDescription)")
                return
            }
            self.showSuccess("Profile updated successfully!")
        }
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func showSuccess(_ message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
