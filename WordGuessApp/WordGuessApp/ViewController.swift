//
//  ViewController.swift
//  WordGuessApp
//
//  Created by Venkata kishore korrapati on 2/13/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayOL: UILabel!
    @IBOutlet weak var hintOL: UILabel!
    @IBOutlet weak var inputOL: UITextField!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var messageOL: UILabel!
    @IBOutlet weak var playagainBtn: UIButton!
    
    
    var words = [["Rohit","Call Him Hit-Man"],
                 ["Palnadu","NRT Headquarters"],
                 ["RVR&JC","First Autonomous in Guntur"],
                 ["AMARAVATHI","AP Capital"]]
    
    var count = 0;
    var word = ""
    var lettersGuessed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Initially check button needs to be disabled
        checkBtn.isEnabled = false;
        //read the first word from the array
        word = words[count][0]
        
        displayOL.text = ""
        
        //initially the display label should be populate with underscores. the # of underscore is equal to # of characters in the word
        updateUnderscores();
        
        //get the first hint from the array
        hintOL.text = "Hint: " + words[count][1]
        //clear the status label initially.
        messageOL.text = ""
        
    }
    
    @IBAction func checkBtnClick(_ sender: UIButton) {
        // Get the text from the textfield
        var letter = inputOL.text!
        //Replace the guessed letter if the letter is part of the word.
        lettersGuessed = lettersGuessed + letter
        var revealedWord = ""
        for c in word {
            if lettersGuessed.contains(c){
                revealedWord += "\(c)"
            }
            else{
                revealedWord += " -"
            }
        }
        // Assigning the word to displayOL after a guess
        displayOL.text = revealedWord
        inputOL.text = ""
        
        //if the word is guessed correctly , we are enabling play again button and disabling the check button
        if displayOL.text!.contains(" -") == false{
            playagainBtn.isHidden = false;
            checkBtn.isEnabled = false;
        }
        checkBtn.isEnabled = false
    }
    
    @IBAction func playAgainBtnClick(_ sender: UIButton) {
        // Reset the button to disable initially.
        playagainBtn.isHidden = true
        //clear the label
        lettersGuessed = ""
        count += 1
        // if count reaches the end of the array(all the words are guessed successully), then print the congratulations on status label
        if count == words.count{
            messageOL.text = "Congratulations!! the game is completed"
            //clearing the labels
            displayOL.text = ""
            hintOL.text = ""
        }
        else{
            word = words[count][0]
            hintOL.text = "Hint: " + words[count][1]
            //Enabling the check button.
            checkBtn.isEnabled = true
            
            displayOL.text = ""
            updateUnderscores()
        }
    }
    
    @IBAction func letterEntered(_ sender: UITextField) {
        //Read the data from the text field
        var textEnterd = inputOL.text!;
        //Consider only the last character by calling textEntered.last and trimming the white spaces.
        textEnterd = String(textEnterd.last ?? " ").trimmingCharacters(in: .whitespaces)
        inputOL.text = textEnterd
        
        //Check whether the entered text is empty or not to enable check button.
        if textEnterd.isEmpty{
            checkBtn.isEnabled = false
        }
        else{
            checkBtn.isEnabled = true
            
        }
    }
        func updateUnderscores(){
            for letter in word{
                displayOL.text! += " - "
            }
        }
        
    }

