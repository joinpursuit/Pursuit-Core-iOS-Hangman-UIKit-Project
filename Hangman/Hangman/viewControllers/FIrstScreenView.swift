//
//  FIrstScreenView.swift
//  Hangman
//
//  Created by Joshua Viera on 11/24/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class FIrstScreenView: UIViewController {
    
    
    
    
    @IBOutlet weak var InitialWord: UITextField!
    @IBOutlet weak var Prompt: UILabel!
    @IBOutlet weak var changePageButton: UIButton!
    
  
    var hangManBrain = HangManBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        changePageButton.isHidden = true
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        var underScores = hangManBrain.underScores
        var randomWord = hangManBrain.randomWord
        var wins = hangManBrain.wins
        var incorrect = hangManBrain.wrongChar
        var alphabet = hangManBrain.alphabet
        var guessesLeft = hangManBrain.numberOfGuesses
        var losses = hangManBrain.losses
        var charSelected = hangManBrain.singleChar
        var guessBox = hangManBrain.userGuesses
        let randomWordArray = Array(randomWord)
        
        
        
        if segue.identifier == "segueName" {
            guard let word = InitialWord.text , let controller = segue.destination as? ViewController else { fatalError("text field is empty") }
            for _ in word {
                underScores.append("_ ")
                randomWord = underScores.joined()
            }
            
            
            
            
            
            
            if InitialWord.hasText == false || InitialWord.text == nil  {
//                changePageButton.isEnabled = false
                Prompt.text = "Invalid Entry, Please Type in a Word"

            } else if InitialWord.hasText == true || InitialWord.text != nil  {
                changePageButton.isHidden = false
                changePageButton.isEnabled = true
                controller.word = randomWord
                clearTextField()
//                InitialWord.isEnabled = true
            }
        }
    }
    
    func clearTextField() {
        if InitialWord.hasText == true {
            InitialWord.text = ""
        }
    }
    
    
    
    
    @IBAction func changePage(_ sender: UIButton) {
            sender.isEnabled = true
    }
}


//
