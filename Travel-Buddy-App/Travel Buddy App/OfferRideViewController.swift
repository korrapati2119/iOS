//
//  OfferRideViewController.swift
//  Travel Buddy App
//
//  Created by Venkata kishore korrapati on 4/15/25.
//

import UIKit
import MapKit

class OfferRideViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, MKLocalSearchCompleterDelegate {
    @IBOutlet weak var pickupTextField: UITextField!
    
    @IBOutlet weak var destinationTextField: UITextField!
        
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    
    @IBOutlet weak var seatsTextField: UITextField!
    
    @IBOutlet weak var suggestionsTableView: UITableView!
    
    @IBOutlet weak var sliderOL: UISlider!
    
    @IBOutlet weak var priceOL: UITextField!
        
        var seatsRequired: Int = 1
        var searchCompleter = MKLocalSearchCompleter()
        var searchResults = [MKLocalSearchCompletion]()
        var activeTextField: UITextField?

        override func viewDidLoad() {
            super.viewDidLoad()

            // Set delegates
            pickupTextField.delegate = self
            destinationTextField.delegate = self
            suggestionsTableView.delegate = self
            suggestionsTableView.dataSource = self

            // Initialize search completer
            searchCompleter.delegate = self
            suggestionsTableView.isHidden = true

            // Setup slider
            sliderOL.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)

            // Initial price
            updatePrice()
        }

        // Handle seat count with stepper
        @IBAction func seatsStepperChanged(_ sender: UIStepper) {
            seatsRequired = Int(sender.value)
            seatsTextField.text = "\(seatsRequired)"
        }

        // Handle text change in pickup and destination fields
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            activeTextField = textField
            let currentText = (textField.text ?? "") as NSString
            let updatedText = currentText.replacingCharacters(in: range, with: string)
            searchCompleter.queryFragment = updatedText
            return true
        }

        // Slider value change handler
        @objc func sliderValueChanged() {
            updatePrice()
        }

        // Update the price based on slider value
        func updatePrice() {
            let price = sliderOL.value * 10 // Example: slider range 0-10 maps to price 0-100
            priceOL.text = String(format: "$%.2f", price)
        }

        // TableView DataSource methods for location suggestions
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return searchResults.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionCell", for: indexPath)
            cell.textLabel?.text = searchResults[indexPath.row].title
            return cell
        }

        // TableView Delegate method to select location
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedLocation = searchResults[indexPath.row].title
            activeTextField?.text = selectedLocation
            suggestionsTableView.isHidden = true
            view.endEditing(true)
        }

        // MKLocalSearchCompleter delegate method for updating search results
        func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
            searchResults = completer.results
            suggestionsTableView.reloadData()
            suggestionsTableView.isHidden = searchResults.isEmpty
        }

        func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
            print("Error fetching suggestions: \(error.localizedDescription)")
        }

        // Dismiss the suggestions when tapping outside
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
            suggestionsTableView.isHidden = true
        }

        // Prepare for the segue to book the ride
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popupsegue" { // Make sure you set this identifier in your storyboard
            if let destinationVC = segue.destination as? ConfirmationViewController {
                // Pass any dynamic data here
                destinationVC.confirmationMessage = "Your ride request is in consideration. We'll notify you shortly 🤩"
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
