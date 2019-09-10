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
        print("In viewDidLoad, is guessed letter field the first responder?", guessedLetterField.isFirstResponder)
    }

 
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UILabel!
    @IBOutlet weak var flowerImageView: UIImageView!
    
   
    
    func updateUIAfterGuess(){
        guessedLetterField.text = ""
        guessedLetterField.resignFirstResponder()
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: Any) {
    }
    
    
    
    @IBAction func guessLetterButtonPressed(_ sender: Any) {
        updateUIAfterGuess()
    }
    
    @IBAction func plagAgainButtonPressed(_ sender: Any) {

    }

    @IBAction func doneKeyPressed(_ sender: Any) {
        updateUIAfterGuess()
    }
    

}


