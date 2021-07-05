//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


class HangmanViewController: UIViewController {
    
    @IBOutlet weak var userInputWord: UITextField!
    @IBOutlet weak var guessingWord: UILabel!
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var userInputLetter: UITextField!
    @IBOutlet weak var directionsLabel: UILabel!
    
    var hangman = HangmanBrain()

  override func viewDidLoad() {
    super.viewDidLoad()
    userInputWord.delegate = self
    userInputLetter.delegate = self
    userInputLetter.isEnabled = false
    hangmanImage.image = UIImage(named: HangmanImages.defaultImage)
    restartGame()
    
  }
    func restartGame() {
        hangman = HangmanBrain()
        userInputWord.text = ""
        userInputWord.isEnabled = true
        guessingWord.text = ""
        hangmanImage.image = UIImage(named: HangmanImages.defaultImage)
        userInputLetter.isEnabled = false
        directionsLabel.text = "Enter a letter"
    }
    
    
    
    
}
extension HangmanViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        hangman.userInputWord = userInputWord.text!.uppercased()
        hangman.userInputLetter = userInputLetter.text!.uppercased()
        var word = ""
        for _ in 0..<hangman.userInputWord.count {
            word += " _ "
        }
        guessingWord.text = word
        userInputWord.isEnabled = false
        userInputLetter.isEnabled = true
        
        if textField == userInputLetter {
            if !hangman.guessedLetters.contains(hangman.userInputLetter) {
                if hangman.checkingWord(userWordInput: hangman.userInputWord, userWordGuess: hangman.userInputLetter) == true {
                    directionsLabel.text = "You guessed correctly"
                } else {
                    directionsLabel.text = "You guessed incorrectly"
                }
            } else {
                directionsLabel.text = "You already guessed that letter"
                textField.text = ""
            }
            
            textField.text = ""
            guessingWord.text = hangman.replaceDashes(word: hangman.userInputWord)
            
            
            
            if hangman.correctGuesses == hangman.userInputWord.count {
                directionsLabel.text = "You win, the word is \(hangman.userInputWord)"
                hangmanImage.image = UIImage(named: HangmanImages.youWin)
                userInputLetter.isEnabled = false
            } else if hangman.wrongGuesses > 0 && hangman.wrongGuesses < 6 {
                switch hangman.wrongGuesses {
                case 1:
                    hangmanImage.image = UIImage(named: HangmanImages.oneWrongGuess)
                case 2:
                    hangmanImage.image = UIImage(named: HangmanImages.twoWrongGuess)
                case 3:
                    hangmanImage.image = UIImage(named: HangmanImages.threeWrongGuess)
                case 4:
                    hangmanImage.image = UIImage(named: HangmanImages.fourWrongGuess)
                case 5:
                    hangmanImage.image = UIImage(named: HangmanImages.fiveWrongGuess)
                default:
                    hangmanImage.image = UIImage(named: "Default Image")!
                }
            } else if hangman.wrongGuesses == 6 {
                hangmanImage.image = UIImage(named: HangmanImages.sixWrongGuess)
                directionsLabel.text = "You lose, the word is \(hangman.userInputWord)"
                userInputLetter.isEnabled = false
            }
        }
        
        
        return true
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string.rangeOfCharacter(from: CharacterSet.letters) != nil) || (string == "" && range.length > 0) {
        
            return userInputLetter.text!.count < 1
        } else {
        directionsLabel.text = "Enter alphabets only"
        return false
        }
    }

    @IBAction func newGame (_ sender: UIButton) {
        restartGame()
    }
}

