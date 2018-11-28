//
//  2PlayerViewController.swift
//  Hangman
//
//  Created by Jian Ting Li on 11/24/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TwoPlayerViewController: UIViewController {

    @IBOutlet weak var playerWordTextField: UITextField!
    @IBOutlet weak var userGuessedLetter: UITextField!
    @IBOutlet weak var guessTheWordTextField: UITextField!
    
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var hangmanPic: UIImageView!
    
    @IBOutlet weak var blanksLabel: UILabel!
    @IBOutlet weak var guessedLetters: UILabel!
    @IBOutlet weak var strikes: UILabel!
    
    var gameBrain = HangmanBrain()
    var winGame = false {
        didSet {
            guard winGame else { return }
            //hide all textFields
            playerWordTextField.isHidden = true
            userGuessedLetter.isHidden = true
            guessTheWordTextField.isHidden = true
            
            //game status you win
            gameStatus.text = "You Win! 😃"
            
            //reveal word on that blank label
            blanksLabel.text = gameBrain.wordArr.joined(separator: " ")
        }
    }
    
    //didset for these 2 variable (check for win and lose)
        //variable for wordArr
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerWordTextField.delegate = self
        userGuessedLetter.delegate = self
        guessTheWordTextField.delegate = self
        setUpGame()
    }
    
    private func setUpGame() {
        gameStatus.text = ""
        blanksLabel.text = ""
        
        //userGuessedLetter.isHidden = true
        guessTheWordTextField.isHidden = true
        
        hangmanPic.image = gameBrain.hangmanPics[gameBrain.strikeNum].image
    }
    
    
    @IBAction func newGame(_ sender: Any) {
        setUpGame()
        
        //reveal the playerWordTextField Label
        playerWordTextField.isHidden = false
        
        //stikes back to zero in label
        strikes.text = "Strikes: 0"
        guessedLetters.text = "Guessed:"
        
        //reset variables: guessed letters, strikes, wingGame
        gameBrain.guessedLetters = [String]()
        gameBrain.strikeNum = 0
        winGame = false
    }

}

extension TwoPlayerViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        switch textField {
        case playerWordTextField:
            //store the word in brain.word (uppercased it)
            //beak the word into an arr and store in wordArr (in brain)
            //create an array of blanks & output in the View (joined w/ separator space)
            //hid this textfield & reveal userGuessedLetters + guessTheWordTextField
            break
        case userGuessedLetter:
            //guard against already guessed words
                //iterate the guessed arr
            //check if the letter in the wordArr
                //yes --> game status ("there's a _")
                    //check for win********
                //no -->  game status ("sorry wrong letter")
                        //update Strike label & variable (strike += 1)
                        //update hangman picture to next one (+1 body part)
            
            //update Blank variable and label
                //loop over wordArr
                    //if matched replade the blank with the actual letter based on index
                //use joined to update blank label
            
            //update guessedLetters variable and label
                //add the letter into the gussed array
                //sort the arr
                //update label
            break
        case guessTheWordTextField:
            //uppercased the input and compared to the word
                //matched:
                    //"you win"********** use
                    //show the word (reveal the blanks --> use the wordArr instead to update the blank label)
                //not matched:  strike += 1     wrong guess (game status)
            break
        default:
            return false
        }
        //use a didSet property on blankArr to check for win
            //make sure all textfield is hidden when the user wins
        
        //don't forget to secure textfield the 1st one
        
        return true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == userGuessedLetter {
            let uppercasedInputLetter = string.uppercased()
            
            //user enters an alphabet
            //user enters an ungussed letter
            guard HangmanBrain.alphabets.contains(uppercasedInputLetter),
                !gameBrain.guessedLetters.contains(uppercasedInputLetter) else { return false }
            
            //capitalized the input & limit to only 1 char input
            textField.text = uppercasedInputLetter
            return false
        }
        
        return true
    }
    
    
}
