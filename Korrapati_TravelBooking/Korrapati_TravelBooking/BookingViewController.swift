//
//  ViewController.swift
//  Korrapati_TravelBooking
//
//  Created by Venkata kishore korrapati on 4/17/25.
//

import UIKit

class BookingViewController: UIViewController {
    
    @IBOutlet weak var travellerNameOL: UITextField!
    
    @IBOutlet weak var noOfTravellersOL: UITextField!
    
    @IBOutlet weak var cabinTypeOL: UITextField!
    
    var travellerName: String = ""
    var noOfTravellers: Int = 0
    var cabinType: String = ""
    var totalCost: Int = 0
    var resultMessage: String = ""
    var imageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bookNowButton(_ sender: UIButton) {
        if let name = travellerNameOL.text, !name.isEmpty {
            if let travellersText = noOfTravellersOL.text, let travellerCount = Int(travellersText) {
                if let cabin = cabinTypeOL.text, !cabin.isEmpty {
                    
                    travellerName = name
                    noOfTravellers = travellerCount
                    cabinType = cabin.lowercased()
                    
                    if cabinType == "economy" {
                        totalCost = 150 * travellerCount
                        resultMessage = "Enjoy your Economy Trip!"
                        imageName = "economy"
                    } else if cabinType == "luxury" {
                        totalCost = 250 * travellerCount
                        resultMessage = "Enjoy your Luxury Trip!"
                        imageName = "luxury"
                    } else {
                        totalCost = 0
                        resultMessage = "Please select a valid class."
                        imageName = "invalid"
                    }
                    
                    
                    
                } else {
                    showAlert(message: "Please enter cabin type.")
                }
            } else {
                showAlert(message: "Please enter a valid number of travellers.")
            }
        } else {
            showAlert(message: "Please enter the traveller name.")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            if let destinationVC = segue.destination as? KorrapatiResultViewController {
                destinationVC.travellerName = travellerName
                destinationVC.noOfTravellers = noOfTravellers
                destinationVC.cabinType = cabinType
                destinationVC.totalCost = totalCost
                destinationVC.resultMessage = resultMessage
                destinationVC.imageName = imageName
            }
        }
    }
    func showAlert(message: String) {
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Input Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            present(alert, animated: true)
        }
    }
    
}
