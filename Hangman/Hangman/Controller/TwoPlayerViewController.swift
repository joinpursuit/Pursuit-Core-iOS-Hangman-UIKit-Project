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
                gameStatusLabel.text = "You Lose! Better Luck Next Time 😇."
                
                playerWordTextField.isHidden = true
                userGuessedLetter.isHidden = true
                guessTheWordTextField.isHidden = true
                
                blanksLabel.text = wordArr.joined(separator: " ")
            }
        }
    }
    
    var winGame = false {
        didSet {
            guard winGame else { return }
            
            gameStatusLabel.text = "You Win! 😃"

            playerWordTextField.isHidden = true
            userGuessedLetter.isHidden = true
            guessTheWordTextField.isHidden = true
            
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
            
            guard let playerWord = textField.text else {
                gameStatusLabel.text = "Invalid Input ☹️"
                return false
            }
            word = playerWord.uppercased()
            
            //break the word into an arr
            word.forEach {(char: Character) -> () in
                let charStringConvert = String(char)
                wordArr.append(charStringConvert)
            }
            print(wordArr)
            
            //Array of blanks & Output in the View
            wordArr.forEach { (letter: String) -> () in
                letter == " " ? blankArr.append(" "): blankArr.append("_")
            }
            print(blankArr)
            blanksLabel.text = blankArr.joined(separator: " ")
            
            playerWordTextField.isHidden = true
            userGuessedLetter.isHidden = false
            guessTheWordTextField.isHidden = false
            
            
        case userGuessedLetter:
            
            guard let guessedLetter = textField.text, guessedLetter != "" else {
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
            if wordArr.contains(guessedLetter) {  //yes
        
                gameStatusLabel.text = "Yah 😃! There's  \"\(guessedLetter)\" !"
                
                //update Blank variable and label
                for (index, char) in wordArr.enumerated() {
                    if String(char) == guessedLetter {
                        blankArr[index] = guessedLetter
                    }
                }
                blanksLabel.text = blankArr.joined(separator: " ")
                
                //🙀check for win🙀
                winGame = word == blankArr.joined()
                
            } else {    //no
            
                gameStatusLabel.text = "Sorry, no \"\(guessedLetter)\" 😕."
                
                //update Strike label & variable (strike += 1)
                strikeNum += 1
                strikeLabel.text = "Strike: \(strikeNum)"
                
                //update hangman picture to next one (+1 body part)
                hangmanPicImgView.image = hangmanPicsArr[strikeNum].image
            }
       
        
        case guessTheWordTextField:
            
            let uppercasedGuessedWord = textField.text?.uppercased()
            
            if word == uppercasedGuessedWord {
                winGame = true
            } else {
                gameStatusLabel.text = "Good Guess...but nope! 😕"
                
                strikeNum += 1
                strikeLabel.text = "Strike: \(strikeNum)"
                
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
            
            guard HangmanBrain.alphabets.contains(uppercasedInputLetter) else { return false }
            
            //Uppercased input and limit to 1 letter input
            textField.text = uppercasedInputLetter
            return false
        }
        return true
    }
    
}
