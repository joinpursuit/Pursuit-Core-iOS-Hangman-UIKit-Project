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
    @IBOutlet weak var hangmanPicImgView: UIImageView!
    
    @IBOutlet weak var blanksLabel: UILabel!
    @IBOutlet weak var guessedLettersLabel: UILabel!
    @IBOutlet weak var strikeLabel: UILabel!
    
    
    var word = HangmanBrain.word
    var wordArr = HangmanBrain.wordArr
    
    var blankArr = HangmanBrain.blankArr
    var guessedLettersArr = HangmanBrain.guessedLettersArr
    
    var hangmanPicsArr = HangmanBrain.hangmanPicsArr
    var strikeNum = HangmanBrain.startingStrikeNum {
        didSet {
            if strikeNum > 5 {
                //game status you win
                gameStatusLabel.text = "You Lose! Better Luck Next Time 😇."
                //hide all textFields
                playerWordTextField.isHidden = true
                userGuessedLetter.isHidden = true
                guessTheWordTextField.isHidden = true
                
                //reveal blank label
                blanksLabel.text = wordArr.joined(separator: " ")
            }
        }
    }
    
    var winGame = false {
        didSet {
            guard winGame else { return }
            
            //game status you win
            gameStatusLabel.text = "You Win! 😃"
            
            //hide all textFields
            playerWordTextField.isHidden = true
            userGuessedLetter.isHidden = true
            guessTheWordTextField.isHidden = true
            
            //reveal blank label
            blanksLabel.text = wordArr.joined(separator: " ")
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
        
        hangmanPicImgView.image = hangmanPicsArr[strikeNum].image
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        setUpGame()
        
        //reveal the playerWordTextField Label
        playerWordTextField.isHidden = false
        
        //stikes back to zero in label
        strikeLabel.text = "Strike: 0"
        guessedLettersLabel.text = "Guessed:"
        
        //reset variables: guessed letters, strikes, wingGame
        guessedLettersArr = HangmanBrain.guessedLettersArr
        strikeNum = HangmanBrain.startingStrikeNum
        wordArr = HangmanBrain.wordArr
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
            word.forEach {(char: Character) -> () in
                let charStringConvert = String(char)
                wordArr.append(charStringConvert)
            }
            print(wordArr)
            
            //create an array of blanks & output in the View (joined w/ separator space)
            wordArr.forEach { (letter: String) -> () in
                letter == " " ? blankArr.append(" "): blankArr.append("_")
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
            
            guard !guessedLettersArr.contains(guessedLetter) else {
                gameStatusLabel.text = "You already enter \"\(guessedLetter)\"."
                return false
            }
            
            //add letter to guessedLettersArr & sort it
            guessedLettersArr.append(guessedLetter)
            guessedLettersArr.sort()
            //update guessed letter variables
            guessedLettersLabel.text = "Guessed:\n\(guessedLettersArr.joined(separator: " "))"

            //check if the letter in the wordArr
            if wordArr.contains(guessedLetter) {
                //yes --> game status ("there's a _")
                    //check for win********
                gameStatusLabel.text = "Yah 😃! There's  \"\(guessedLetter)\" !"
                
                //update Blank variable and label
                    //loop over wordArr
                        //if matched replade the blank with the actual letter based on index
                    //use joined to update blank labe
                for (index, char) in wordArr.enumerated() {
                    if String(char) == guessedLetter {
                        blankArr[index] = guessedLetter
                    }
                }
                blanksLabel.text = blankArr.joined(separator: " ")
                
                //🙀check for win🙀
                winGame = word == blankArr.joined()
                
            } else {
                //no -->  game status ("sorry wrong letter")
                gameStatusLabel.text = "Sorry, no \"\(guessedLetter)\" 😕."
                
                //update Strike label & variable (strike += 1)
                strikeNum += 1
                strikeLabel.text = "Strike: \(strikeNum)"
                
                //update hangman picture to next one (+1 body part)
                hangmanPicImgView.image = hangmanPicsArr[strikeNum].image
            }
       
        
        case guessTheWordTextField:
            //uppercased the input and compared to the word
                //matched:
                    //"you win"********** use
                    //show the word (reveal the blanks --> use the wordArr instead to update the blank label)
                //not matched:  strike += 1     wrong guess (game status)
            let uppercasedGuessedWord = textField.text?.uppercased()
            
            if word == uppercasedGuessedWord {
                winGame = true
            } else {
                gameStatusLabel.text = "Good Guess...but nope! 😕"
                
                //update Strike label & variable (strike += 1)
                strikeNum += 1
                strikeLabel.text = "Strike: \(strikeNum)"
                
                //update hangman picture to next one (+1 body part)
                hangmanPicImgView.image = hangmanPicsArr[strikeNum].image
            }
            
        default:
            return false
        }
        
        //🙀don't forget to secure textfield the 1st one🙀
        
        //after pressing return, turn textfield back to blank
        textField.text = ""
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
