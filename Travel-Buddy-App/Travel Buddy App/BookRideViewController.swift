//
//  BookRideViewController.swift
//  Travel Buddy App
//
//  Created by Venkata kishore korrapati on 4/17/25.
//

import UIKit
import MapKit

class BookRideViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate,MKLocalSearchCompleterDelegate {
    

    @IBOutlet weak var pickupTextField: UITextField!
    
    @IBOutlet weak var destinationTextField: UITextField!
    
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    
    @IBOutlet weak var seatsTextField: UITextField!
    
    @IBOutlet weak var suggestionsTableView: UITableView!
    
    var seatsRequired: Int = 1
    var searchCompleter = MKLocalSearchCompleter()
      var searchResults = [MKLocalSearchCompletion]()
      var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

                pickupTextField.delegate = self
                destinationTextField.delegate = self
                suggestionsTableView.delegate = self
                suggestionsTableView.dataSource = self

                searchCompleter.delegate = self
                suggestionsTableView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func seatsStepperChanged(_ sender: UIStepper) {
        seatsRequired = Int(sender.value)
              seatsTextField.text = "\(seatsRequired)"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        activeTextField = textField
                let currentText = (textField.text ?? "") as NSString
                let updatedText = currentText.replacingCharacters(in: range, with: string)
                searchCompleter.queryFragment = updatedText
                return true
            }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return searchResults.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionCell", for: indexPath)
                   cell.textLabel?.text = searchResults[indexPath.row].title
                   return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedLocation = searchResults[indexPath.row].title
                   activeTextField?.text = selectedLocation
                   suggestionsTableView.isHidden = true
                   view.endEditing(true)
        }
        
        func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
            searchResults = completer.results
                    suggestionsTableView.reloadData()
                    suggestionsTableView.isHidden = searchResults.isEmpty
        }
        
        func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
            print("Error fetching suggestions: \(error.localizedDescription)")
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
            suggestionsTableView.isHidden = true
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ridesdisplay" {
            if let destinationVC = segue.destination as? ridesDisplayViewController {
                destinationVC.pickupLocation = pickupTextField.text
                destinationVC.destinationLocation = destinationTextField.text
                destinationVC.selectedDate = dateTimePicker.date
                destinationVC.numberOfSeats = seatsRequired
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
