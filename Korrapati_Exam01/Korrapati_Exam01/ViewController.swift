//
//  ViewController.swift
//  Korrapati_Exam01
//
//  Created by Venkata kishore korrapati on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pmOneOutlet: UITextField!
    
    @IBOutlet weak var pmTwoOutlet: UITextField!
    
    @IBOutlet weak var aqcResult: UILabel!
    
    
    @IBOutlet weak var airQualityImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateAqc(_ sender: Any) {
        if let pm25Text = pmOneOutlet.text, let pm10Text = pmTwoOutlet.text {
            // Checking if pmone and pmtwo values are numeric
            if let pm25 = Double(pm25Text), let pm10 = Double(pm10Text) {
                // Calculate the AQC value based on inputs
                let aqc = (pm25 + pm10) / 2
                let roundedAqc = round(aqc * 10) / 10.0
                
                // Displaying the AQC value
                aqcResult.text = "The AQC value is \(roundedAqc).\nThis air quality is considered to be \n \(airQualityCategory(aqc: roundedAqc)) quality air."
                
                // Updating the image based on the air quality
                updateAirQualityImg(aqc: roundedAqc)
            } else {
                displayError(message: "Please enter valid numeric values for PM2.5 and PM10.")
            }
        } else {
            displayError(message: "Please enter the input values for PM2.5 and PM10.")
        }
    }
    @IBAction func resetBtn(_ sender: Any) {
        pmOneOutlet.text = ""
        pmTwoOutlet.text = ""
        aqcResult.text = ""
        airQualityImg.image = nil
    }
    func airQualityCategory(aqc: Double) -> String {
        switch aqc {
        case ..<50 :
            return "Best👍"
        case 50..<100 :
            return "Moderate😕"
        default :
            return "Poor😢"
        }
    }
    // Updating the air quality image based on the category
    func updateAirQualityImg(aqc: Double) {
        if aqc < 50 {
            airQualityImg.image = UIImage(named: "Best")
        } else if aqc < 100 {
            airQualityImg.image = UIImage(named: "Moderate")
        } else {
            airQualityImg.image = UIImage(named: "Poor")
        }
    }
    
    // Display error messages
    func displayError(message: String) {
        aqcResult.text = message
        airQualityImg.image = nil
    }
}
