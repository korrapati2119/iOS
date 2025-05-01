//
//  createaccountViewController.swift
//  Travel Buddy App
//
//  Created by Durga Ramdas Raja on 4/2/25.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class createaccountViewController: UIViewController {
    
    @IBOutlet weak var firstNameOL: UITextField!
    
    @IBOutlet weak var lastNameOL: UITextField!
    
    @IBOutlet weak var pwdOL: UITextField!
    
    @IBOutlet weak var confirmPwdOL: UITextField!
    
    @IBOutlet weak var emailOL: UITextField!
    
    @IBOutlet weak var phoneNumberOL: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func CreateAccountButton(_ sender: Any) {
        let firstName = firstNameOL.text
                let lastName = lastNameOL.text
                let password = pwdOL.text
                let confirmPassword = confirmPwdOL.text
                let email = emailOL.text
                let phoneNumber = phoneNumberOL.text ?? ""
        
        if firstName == nil || firstName == "" || lastName == nil || lastName == "" {
                   showError("First and Last name are required.")
                   return
               }
               if password == nil || password == "" || confirmPassword == nil || confirmPassword == "" {
                   showError("Password and Confirm password are required.")
                   return
               }
               if password != confirmPassword {
                   showError("Passwords do not match.")
                   return
               }
               if email == nil || email == "" {
                   showError("Email is required.")
                   return
               }
               if phoneNumber.isEmpty {
                   showError("Phone number is required.")
                   return
               }

               // Create user in Firebase Authentication
               Auth.auth().createUser(withEmail: email!, password: password!) { (result, error) in
                   if let error = error {
                       self.showError(error.localizedDescription)
                       return
                   }
                   
                   if let user = result?.user {
                       let uid = user.uid

                       // Store user data in Firebase Database
                       let userData: [String: Any] = [
                           "firstName": firstName!,
                           "lastName": lastName!,
                           "email": email!,
                           "phoneNumber": phoneNumber
                       ]
                       self.ref.child("users").child(uid).setValue(userData) { (error, ref) in
                           if let error = error {
                               self.showError("Failed to save user data: \(error.localizedDescription)")
                               return
                           }
                           self.showSuccess("Account created successfully!")
                           
                           // Navigate back to login or home screen
                           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                               self.navigationController?.popViewController(animated: true)
                           }
                       }
                   }
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
