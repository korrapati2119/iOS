//
//  ridesDisplayViewController.swift
//  Travel Buddy App
//
//  Created by Venkata kishore korrapati on 4/26/25.
//

import UIKit
import Foundation

struct Ride {
    var pickupLocation: String
    var destinationLocation: String
    var date: Date
    var availableSeats: Int
}

class ridesDisplayViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pickupLabel: UILabel!
       @IBOutlet weak var destinationLabel: UILabel!
       @IBOutlet weak var dateLabel: UILabel!
       @IBOutlet weak var seatsLabel: UILabel!
            
    @IBOutlet weak var ridesTableView: UITableView!
    var rides: [Ride] = [Ride(pickupLocation: "New York, NY", destinationLocation: "Los Angeles, CA", date: Date(), availableSeats: 3),
                             Ride(pickupLocation: "San Francisco, CA", destinationLocation: "Seattle, WA", date: Date().addingTimeInterval(86400), availableSeats: 2),
                             Ride(pickupLocation: "Chicago, IL", destinationLocation: "Austin, TX", date: Date().addingTimeInterval(172800), availableSeats: 1),
                             Ride(pickupLocation: "Miami, FL", destinationLocation: "Orlando, FL", date: Date().addingTimeInterval(259200), availableSeats: 4),
                             Ride(pickupLocation: "Dallas, TX", destinationLocation: "Houston, TX", date: Date().addingTimeInterval(345600), availableSeats: 5)]
    var pickupLocation: String?
        var destinationLocation: String?
        var selectedDate: Date?
        var numberOfSeats: Int?
    override func viewDidLoad() {
            super.viewDidLoad()
            ridesTableView.delegate = self
                    ridesTableView.dataSource = self
               //     confirmButton.isUserInteractionEnabled = false
                 //   confirmButton.alpha = 0.5
            
                    pickupLabel.isHidden = true
                    destinationLabel.isHidden = true
                    dateLabel.isHidden = true
                    seatsLabel.isHidden = true
                    
                    ridesTableView.reloadData()
            
            // Do any additional setup after loading the view.
        }
        
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return rides.count
           }

           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = tableView.dequeueReusableCell(withIdentifier: "RideCell", for: indexPath)
               
               let ride = rides[indexPath.row]
               
               cell.textLabel?.text = "\(ride.pickupLocation) -> \(ride.destinationLocation)"
               cell.detailTextLabel?.text = "Date: \(formatDate(date: ride.date)) | Seats: \(ride.availableSeats)"
               
               return cell
           }
           
           func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               let selectedRide = rides[indexPath.row]

                   pickupLabel.text = "Pickup: \(selectedRide.pickupLocation)"
                   destinationLabel.text = "Destination: \(selectedRide.destinationLocation)"
                   dateLabel.text = "Date: \(formatDate(date: selectedRide.date))"
                   seatsLabel.text = "Seats Available: \(selectedRide.availableSeats)"

                   pickupLabel.isHidden = false
                   destinationLabel.isHidden = false
                   dateLabel.isHidden = false
                   seatsLabel.isHidden = false
            //   confirmButton.isEnabled = true
             //  confirmButton.alpha = 1.0
           }
           
        func formatDate(date: Date) -> String {
               let formatter = DateFormatter()
               formatter.dateStyle = .medium
               formatter.timeStyle = .short
               return formatter.string(from: date)
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
