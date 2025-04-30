//
//  ViewController.swift
//  Korrapati_WordGuess
//
//  Created by Venkata kishore korrapati on 3/1/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var totalWordsLabel: UILabel!
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessLetterField: UITextField!
    
    @IBOutlet weak var guessLetterButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var displayImage: UIImageView!
    
    let words :  [(String, String, String)] = [("Korrapati","Initial","korrapati"),
                                       ("RVR","UG College","rvrjctdp"),
                                       ("PALNADU","District","palnadu"),
                                       ("VAYYAKALLU","Village", "vayyakallu"),
                                       ("ROHIT","Ict captain", "hitman")];
    var maxNumOfWrongGuesses = 10
    var currentWordIndex = 0
    var wordGuesses = ""
    var wrongGuesses = 0
    var guessedLetters: [Character] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameSetup()
        guessLetterButton.isEnabled = false
    }
    func gameSetup() {
        guessCountLabel.text = "You have Made Zero Guesses"
        statusLabel.text = "..."
        wordsGuessedLabel.text = "Total number of words guessed successfully:\(currentWordIndex)"
        wordsRemainingLabel.text = "Total number of words remaining in game:\(words.count - currentWordIndex)"
        totalWordsLabel.text = "Total number of words in game: \(words.count)"
        let currentWord = words[currentWordIndex].0.uppercased()
        wordGuesses = String(repeating: "_ ", count: currentWord.count)
        userGuessLabel.text = wordGuesses
        hintLabel.text = "Hint: \(words[currentWordIndex].1)"
        playAgainButton.isHidden = true
        guessLetterButton.isEnabled = false
        displayImage.isHidden = true
        wrongGuesses = 0
        guessedLetters.removeAll()
    }
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        // Check if the input letter is valid (single character)
            if let guessedLetter = guessLetterField.text?.uppercased(), guessedLetter.count == 1 {
                let letter = guessedLetter.first

                let currentWord = words[currentWordIndex].0.uppercased()
                let currentImageName = words[currentWordIndex].2

                // Check if the guessed letter is in the current word
                if currentWord.contains(letter!) {
                    guessedLetters.append(letter!)
                    wordGuesses = ""
                    
                    // Update wordGuesses to show correct letters
                    for c in currentWord {
                        wordGuesses.append(guessedLetters.contains(c) ? "\(c) " : "_ ")
                    }
                    
                    userGuessLabel.text = wordGuesses.trimmingCharacters(in: .whitespaces)
                    statusLabel.text = "Good guess! Keep going."
                } else {
                    // Incorrect guess
                    wrongGuesses += 1
                    statusLabel.text = "Wrong guess. Try again."
                }

                // Update total guesses and remaining guesses
                let totalGuesses = guessedLetters.count + wrongGuesses
                guessCountLabel.text = "You have made \(totalGuesses) guesses."

                // If the word is guessed correctly
                if !wordGuesses.contains("_") {
                    // If the word is guessed after exactly 10 guesses
                    if totalGuesses == 10 {
                        guessCountLabel.text = "Wow! You have made 10 guesses to guess the word."
                    } else {
                        statusLabel.text = "You've guessed it correctly! '\(currentWord)' 🎉"
                    }
                    displayImage.image = UIImage(named: currentImageName)
                    displayImage.isHidden = false
                    currentWordIndex += 1

                    // If there are more words to guess
                    if currentWordIndex < words.count {
                        playAgainButton.isHidden = false
                    } else {
                        statusLabel.text = "Congratulations, you are done, please start over again."
                        playAgainButton.isHidden = false
                    }
                } else if wrongGuesses >= maxNumOfWrongGuesses {
                    // If the word was not guessed after 10 wrong guesses
                    guessCountLabel.text = "You have used all the available guesses, please play again."
                    playAgainButton.isHidden = false
                }

                // Clear the text field for the next guess
                guessLetterField.text = ""
                guessLetterButton.isEnabled = false
            }
        }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField)
    {                //The guessLetterField will only keep the last character entered, even if multiple characters are typed
                //Guess a Letter button will be enabled only when there is text in the text field.
                if let text = sender.text, text.count > 1 {
                    sender.text = String(text.last!)
                }
                guessLetterButton.isEnabled = !(sender.text?.isEmpty ?? true)
            }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        if currentWordIndex >= words.count {
            currentWordIndex = 0
            statusLabel.text = "Congratulations, you are done! Please start over again."
            displayImage.isHidden = true
        }
        gameSetup()
    }
}
