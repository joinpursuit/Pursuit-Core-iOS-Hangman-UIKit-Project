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
    title = "Hangman"
    userInputWord.delegate = self
    userInputLetter.delegate = self
    userInputLetter.isEnabled = false
    hangmanImage.image = UIImage(named: HangmanImages.defaultImage)
  }
}
extension HangmanViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userInputWord {
            hangman.wordArray(a: userInputWord.text?.uppercased() ?? "Please input a word")
            userInputWord.isEnabled = false
            return true
           
        } else if textField == userInputLetter {
            hangman.checkingWord(b: userInputLetter.text?.uppercased() ?? "Not A String")
            guessingWord.text = hangman.guessingWord
            directionsLabel.text = hangman.gameText
            userInputLetter.isEnabled = true
            userInputWord.resignFirstResponder()
            return true
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let characters = CharacterSet(charactersIn: "QWERTYUIOPLKJHGFDSAZXCVBNM")
        if (string.rangeOfCharacter(from: characters) != nil) || (string == "" && range.length > 0) {
            directionsLabel.text = hangman.gameText
            return userInputLetter.text!.count < 1 || string == ""
        } else {
            directionsLabel.text = "Enter a valid letter"
            return false
        }
    }
    
    @IBAction func newGame (_ sender: UIButton) {
        hangman.reset()
        userInputWord.isEnabled = true
        userInputWord.text = ""
        directionsLabel.text = "Enter a letter"
        userInputLetter.isEnabled = false
        userInputLetter.text = ""
    }
}

