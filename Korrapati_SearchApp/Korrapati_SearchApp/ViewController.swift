//
//  ViewController.swift
//  Korrapati_SearchApp
//
//  Created by Venkata kishore korrapati on 3/24/25.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var topicInfoText: UITextView!
    
    @IBOutlet weak var searchBtnOL: UIButton!
    
    @IBOutlet weak var resetBtnOL: UIButton!
    
    @IBOutlet weak var prevBtnOL: UIButton!
    
    @IBOutlet weak var nextBtnOL: UIButton!
    
    
    
        var agriculture = ["agric","agrichillies","palnadufields"];
        var landmarks = ["amaravathi","buddas","kotappakonda","palnadu","palnadudam"];
        var space = ["indres","indroc","rocket"];
        var festivals = ["vinayaka","sankranthi","ugadi"];
        var cricket = ["ct","t20","rohitceleb"];
    
        var agriculture_keywords = ["farmer","bulls","cows","farmfields","chillies","ploughing"];
        var landmarks_keywords = ["budda","statue","amaravathi","ap capital","waterfall","temple","nagarjuna sagar dam","dam","tourism"];
        var space_keywords = ["space","rocket","research","india"];
        var festival_keywords = ["god","ganapathi","farmer festival","telugu year","ugadi pickle"];
        var cricket_keywords = ["cricket","50 overs","world cup","cup","20 overs","ict captain","won","rohit","hitman"];
    
    var currentTopic: String = ""
       var currentIndex: Int = 0
    var currentImages: [String] = []
    var currentDescriptions: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultImage!.image = UIImage(named: "welcome.jpeg")
        searchBtnOL.isEnabled = false
        prevBtnOL.isEnabled = false
        nextBtnOL.isEnabled = false
        topicInfoText.text = "Welcome, Korrapati!!"
    }
    
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        if let text = searchTextField.text, !text.isEmpty {
                    searchBtnOL.isEnabled = true
                } else {
                    searchBtnOL.isEnabled = false
                }
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        AudioServicesPlaySystemSound(1113)
        if let searchText = searchTextField.text?.lowercased() {
                    if agriculture_keywords.contains(searchText) {
                        currentTopic = "agriculture"
                        currentImages = agriculture
                        currentDescriptions = ["Agriculture is the most important sector in planadu. It generates a lot of employment for the people. paddy is also one of the most cultivating crop.",
                                               "Red Chillies are the most cultivating crop in palnadu.it makes a lot of money for the farmers and will boost a lot of economy in the state.",
                                               "Palnadu fields are very fertile. It is most suitable for cultivating crops. these fields are very green and lush."]
                    } else if landmarks_keywords.contains(searchText) {
                        currentTopic = "landmarks"
                        currentImages = landmarks
                        currentDescriptions = ["Amaravathi is rich in historical landmarks.It is the capital of newly formed state of andhra pradesh. amaravathi is a greenfield city and self financing capital. it is located in guntur district.",
                                               "The Dhyana Buddha statue in Amaravathi, Andhra Pradesh, India, is a 125-foot-tall statue of Gautama Buddha in a meditative posture, completed in 2015 and embellished with modern reproductions of sculptures from the Amaravati School of art.",
                                               "Kotappakonda also known as Kotappakonda Sri Trikoteswara Swami Temple is a holy hill, situated in Palnadu district, Andhra Pradesh, India. It is located 10 kilometers from Narasaraopet, 20 kilometers from Chilakaluripet town.",
                                               "Palnadu is a district in the coastal Andhra region of the Indian state of Andhra Pradesh, with Narasaraopet as its administrative headquarters, formed on April 4, 2022, from the Gurazala, Sattenapalli, and Narasaraopet revenue divisions.",
                                               "The Palnadu dam likely refers to the Nagarjuna Sagar Dam, a masonry dam on the Krishna River that straddles the border between Nalgonda district in Telangana and Palnadu district in Andhra Pradesh, providing irrigation and electricity."]
                    } else if space_keywords.contains(searchText) {
                        currentTopic = "space"
                        currentImages = space
                        currentDescriptions = ["India's space research efforts are spearheaded by the Indian Space Research Organisation (ISRO), a national space agency responsible for research, development, and execution of space-related projects, with headquarters in Bengaluru.",
                                               "Launchers or Launch Vehicles are used to carry spacecraft to space. India has three active operational launch vehicles: Polar Satellite Launch Vehicle (PSLV), Geosynchronous Satellite Launch Vehicle (GSLV), Geosynchronous Satellite Launch Vehicle Mk-III (LVM3).",
                                               "On January 29, 2025, ISRO successfully launched the GSLV-F15 rocket carrying the NVS-02 satellite from the Satish Dhawan Space Centre, marking a significant milestone for India's space program."]
                    } else if festival_keywords.contains(searchText) {
                        currentTopic = "festivals"
                        currentImages = festivals
                        currentDescriptions = ["Ganesh Chaturthi, also known as Vinayaka Chaturthi or Vinayaka Chavithi is a Hindu festival celebrating the birth of Lord Ganesha. It is a 10-day celebration denoting the arrival of Ganesha on earth, the lord of success and knowledge.",
                                               "Every year Makar Sankranti is celebrated in the month of January. This festival is dedicated to the Hindu religious sun god Surya.",
                                               "This vibrant festival marks the beginning of the Hindu lunisolar calendar month of Chaitra, and it signifies the arrival of spring, a season of new beginnings and rejuvenation."]
                    } else if cricket_keywords.contains(searchText) {
                        currentTopic = "cricket"
                        currentImages = cricket
                        currentDescriptions = ["The ICC Champions Trophy, formerly known as the ICC Knock Out Trophy, is an international One Day International cricket tournament organised by the International Cricket Council contested by international men's teams.",
                                               "The ICC Men's T20 World Cup, formerly the ICC World Twenty20, is a biennial world cup for cricket in Twenty20 International (T20I) format, organised by the International Cricket Council (ICC).",
                                               "Rohit Sharma felt his knees give way. Ironically enough, this was the moment when the weight on his shoulders had actually, finally, lifted."]
                    } else {
                        resultImage.image = UIImage(named: "notfound")
                        topicInfoText.text = "No results found for \(searchText)."
                        return
                    }

                    currentIndex = 0
                    resultImage.image = UIImage(named: currentImages[currentIndex])
                    topicInfoText.text = currentDescriptions[currentIndex]
                    
                    // Enable or disable buttons based on the currentIndex
                    prevBtnOL.isEnabled = false
                    nextBtnOL.isEnabled = currentImages.count > 1
                }
        }
        
        @IBAction func ShowNextImageBtn(_ sender: Any) {
                        AudioServicesPlaySystemSound(1105)
            if currentIndex < currentImages.count - 1 {
                        currentIndex += 1
                        resultImage.image = UIImage(named: currentImages[currentIndex])
                        topicInfoText.text = currentDescriptions[currentIndex]
                        
                        prevBtnOL.isEnabled = true
                        nextBtnOL.isEnabled = currentIndex < currentImages.count - 1
                    }
        }
        
        @IBAction func ShowPrevImageBtn(_ sender: Any) {
            AudioServicesPlaySystemSound(1105)
            if currentIndex > 0 {
                        currentIndex -= 1
                        resultImage.image = UIImage(named: currentImages[currentIndex])
                        topicInfoText.text = currentDescriptions[currentIndex]
                        
                        nextBtnOL.isEnabled = true
                        prevBtnOL.isEnabled = currentIndex > 0
                    }
        }
        
        @IBAction func ResetBtn(_ sender: Any) {
            AudioServicesPlaySystemSound(1111)
            currentTopic = ""
                    currentIndex = 0
                    searchTextField.text = ""
                    resultImage.image = UIImage(named: "welcome")
                    topicInfoText.text = "Hello, Korrapati!!"
                    
                    prevBtnOL.isEnabled = false
                    nextBtnOL.isEnabled = false
                    searchBtnOL.isEnabled = false
        }
    }
    
