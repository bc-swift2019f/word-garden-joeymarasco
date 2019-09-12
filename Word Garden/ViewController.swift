//
//  ViewController.swift
//  Word Garden
//
//  Created by Joseph Marasco on 9/9/19.
//  Copyright © 2019 Joseph Marasco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        
    }

 
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    
    func updateUIAfterGuess(){
        guessedLetterField.text = ""
        guessedLetterField.resignFirstResponder()
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord += " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
        
    }
    
    func guessALetter() {
        formatUserGuessLabel()
        guessCount += 1
        
        // incrememnts the wrong guesses remaining and shows the next flower image with one less pedal
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")}

         
        let revealedWord = userGuessLabel.text!
        // stop game if remaining number of guesses is zero
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So sorry... you are all out of guesses. Try Again?"
        } else if !revealedWord.contains("_"){
            // the user has won the game
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You got it!!! It took you \(guessCount) guesses to guess the word!"
        } else {
           //  update guess count screen
            let guess = ( guessCount == 1 ? "guess" : "guesses")
            guessCountLabel.text = "You have made \(guessCount) \(guess)"
    }
    }
    
    
    @IBAction func guessedLetterFieldChanged(_ sender: Any) {
        if let letterGuessed = guessedLetterField.text?.last{
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            // disable the button, if i dont have a single character in the guessed letter field
            guessLetterButton.isEnabled = false
        }
    }
    
    
    
    @IBAction func guessLetterButtonPressed(_ sender: Any) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func plagAgainButtonPressed(_ sender: Any) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You have made 0 guesses."
        guessCount = 0
    }

    @IBAction func doneKeyPressed(_ sender: Any) {
        guessALetter()
        updateUIAfterGuess()
        
        }
        
    
    }
    





