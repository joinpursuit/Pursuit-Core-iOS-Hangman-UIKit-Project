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
    
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var hangmanPic: UIImageView!
    
    @IBOutlet weak var blanksLabel: UILabel!
    @IBOutlet weak var guessedLetters: UILabel!
    @IBOutlet weak var strikes: UILabel!
    
    
    var word = HangmanBrain.word
    var wordArr = HangmanBrain.wordArr
    
    var blankArr = HangmanBrain.blankArr
    var guessedLettersArr = HangmanBrain.guessedLettersArr
    
    var strikeNum = HangmanBrain.startingStrikeNum
    var hangmanPicsArr = HangmanBrain.hangmanPicsArr
    
    var winGame = false {
        didSet {
            guard winGame else { return }
            //hide all textFields
            playerWordTextField.isHidden = true
            userGuessedLetter.isHidden = true
            guessTheWordTextField.isHidden = true
            
            //game status you win
            gameStatusLabel.text = "You Win! 😃"
            
            //reveal blank label
            blanksLabel.text = blankArr.joined(separator: " ")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerWordTextField.delegate = self
        userGuessedLetter.delegate = self
        guessTheWordTextField.delegate = self
        setUpGame()
    }
    
    private func setUpGame() {
        gameStatusLabel.text = ""
        blanksLabel.text = ""
        
        userGuessedLetter.isHidden = true
        guessTheWordTextField.isHidden = true
        
        hangmanPic.image = hangmanPicsArr[strikeNum].image
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        setUpGame()
        
        //reveal the playerWordTextField Label
        playerWordTextField.isHidden = false
        
        //stikes back to zero in label
        strikes.text = "Strikes: 0"
        guessedLetters.text = "Guessed:"
        
        //reset variables: guessed letters, strikes, wingGame
        guessedLettersArr = HangmanBrain.guessedLettersArr
        strikeNum = HangmanBrain.startingStrikeNum
        winGame = false
    }

}

extension TwoPlayerViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        switch textField {
        case playerWordTextField:
            //store the word in brain.word (uppercased it)
            guard let playerWord = textField.text, playerWord != "" else {
                gameStatusLabel.text = "Invalid Input ☹️"
                return false
            }
            word = playerWord.uppercased()
            
            //break the word into an arr and store in wordArr (in brain)
            wordArr = Array(word)
                print(wordArr)
            
            //create an array of blanks & output in the View (joined w/ separator space)
            wordArr.forEach { (char: Character) -> () in
                char == " " ? blankArr.append(" "): blankArr.append("_")
            }
            print(blankArr)
            blanksLabel.text = blankArr.joined(separator: " ")
            
            
            //hid this textfield & reveal userGuessedLetters + guessTheWordTextField
            playerWordTextField.isHidden = true
            userGuessedLetter.isHidden = false
            guessTheWordTextField.isHidden = false
            
            
        case userGuessedLetter:
            
            guard let guessedLetter = textField.text else {
                gameStatusLabel.text = "Invalid Input"
                return false
            }
            
            guard guessedLettersArr.contains(guessedLetter) else {
                gameStatusLabel.text = "You already enter \"\(guessedLetter)\"."
                return false
            }
            
            //add letter to guessedLettersArr
            guessedLettersArr.append(guessedLetter)

            //check if the letter in the wordArr
                //yes --> game status ("there's a _")
                    //check for win********
                //no -->  game status ("sorry wrong letter")
                        //update Strike label & variable (strike += 1)
                        //update hangman picture to next one (+1 body part)
            if wordArr.contains(guessedLetter) {
                
                //update Blank variable and label
                //loop over wordArr
                //if matched replade the blank with the actual letter based on index
                //use joined to update blank label
            } else {
                break
            }
            
            

            
            //update guessedLetters variable and label
                //sort the arr
                //update label
            textField.text = ""
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
        
        gameStatusLabel.text = ""
        return true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == userGuessedLetter {
            let uppercasedInputLetter = string.uppercased()
            
            //user enters an alphabet
            //user enters an ungussed letter
            guard HangmanBrain.alphabets.contains(uppercasedInputLetter)
                  //,!guessedLettersArr.contains(uppercasedInputLetter)
                else { return false }
            
            //capitalized the input & limit to only 1 char input
            textField.text = uppercasedInputLetter
            return false
        }
        
        return true
    }
    
    
}
