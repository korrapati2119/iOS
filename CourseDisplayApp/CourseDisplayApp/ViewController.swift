//
//  ViewController.swift
//  CourseDisplayApp
//
//  Created by Venkata kishore korrapati on 2/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewOL: UIImageView!
    @IBOutlet weak var courseNumOL: UILabel!
    @IBOutlet weak var courseTtlOL: UILabel!
    @IBOutlet weak var semesterOL: UILabel!
    @IBOutlet weak var prevBtnOL: UIButton!
    @IBOutlet weak var nextBtnOL: UIButton!
    
    let courses = [["img01","44555","Network Security","Fall 2024"],
    ["img02", "44643", "Mobile Computing IOS","Summer 2025"],
                   ["img03", "44222", "Data Streaming", "Spring 2025"]]
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Update the Course details (image , coursenum, title, semester offered) with the first element in the array
        imageViewOL.image = UIImage(named: courses[imageIndex][0])
        courseNumOL.text = courses[imageIndex][1]
        courseTtlOL.text = courses[imageIndex][2]
        semesterOL.text = courses[imageIndex][3]
        // previous button is disabled
        prevBtnOL.isEnabled = false
        // next button is enabled
        nextBtnOL.isEnabled = true
    }
    
    @IBAction func prevBtnClicked(_ sender: UIButton) {
       // Decrement the image index
        imageIndex -= 1
       // Update the course details
        imageViewOL.image = UIImage(named: courses[imageIndex][0])
        courseNumOL.text = courses[imageIndex][1]
        courseTtlOL.text = courses[imageIndex][2]
        semesterOL.text = courses[imageIndex][3]
        //If the imageIndex is 0, the previous button must be disabled
        if(imageIndex == 0){
                    prevBtnOL.isEnabled = false
                } else {
                    prevBtnOL.isEnabled = true
                }
            // next button should be enabled
            nextBtnOL.isEnabled = true
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        // Increment the image
        imageIndex += 1
        
        // Update the course details
        imageViewOL.image = UIImage(named: courses[imageIndex][0])
        courseNumOL.text = courses[imageIndex][1]
        courseTtlOL.text = courses[imageIndex][2]
        semesterOL.text = courses[imageIndex][3]
        
        // Previous should be enabled
        prevBtnOL.isEnabled = true
        // Check if the element is at the end of the array next button should be disabled
        if(imageIndex == courses.count - 1) {
                    nextBtnOL.isEnabled = false
                } else {
                    nextBtnOL.isEnabled = true
                }
        }
    }

