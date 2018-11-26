//
//  ViewController.swift
//  Hangman
//
//  Created by Jane Zhu on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

// to-do
// need to fix issue with typing in repeating letters
// need to fix issue with tracking for win - repeated letters don't count

class ViewController: UIViewController {

    @IBOutlet weak var wordTF: UITextField!
    @IBOutlet weak var guessTF: UITextField!
    @IBOutlet weak var wordDisplay: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var strikeImageDisplay: UIImageView!
    @IBOutlet weak var strikeNumDisplay: UILabel!
    @IBOutlet weak var rightGuess: UILabel!
    @IBOutlet weak var wrongGuess: UILabel!
    override func viewDidLoad() {
    super.viewDidLoad()
    wordTF.delegate = self
    guessTF.delegate = self
    guessTF.isEnabled = false
  }
    
    
    func checkForGameOver() {
        if Brain.gameOver {
            message.text = "YOU WIN."
            guessTF.isEnabled = false
            strikeNumDisplay.text = "Press \"New Game\" to begin"
        }
        if Brain.strikeCounter == 7 {
            message.text = "GAME OVER."
            guessTF.isEnabled = false
            strikeNumDisplay.text = "The word is \(Brain.theWord)"
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        Brain.reset()
        wordTF.text = ""
        wordTF.isEnabled = true
        guessTF.text = ""
        guessTF.isEnabled = false
        strikeImageDisplay.isHidden = true
        strikeNumDisplay.isHidden = true
        wordDisplay.text = "waiting for word input"
        message.text = "Enter a word."
        rightGuess.text = "Right Guess:"
        wrongGuess.text = "Wrong Guess:"
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == wordTF {
            if textField.text?.isEmpty ?? true {
                return true
            }
            Brain.theWord = textField.text!.lowercased()
            wordDisplay.text = Brain.displayUnderscores()
            message.text = "Enter a guess letter."
            guessTF.isEnabled = true
            strikeImageDisplay.isHidden = false
            strikeNumDisplay.isHidden = false
            wordTF.isEnabled = false
            return true
            }
    
        if textField == guessTF {
            if textField.text?.isEmpty ?? true {
                return true
            }
        Brain.guessLetter = textField.text!.lowercased()
        message.text = Brain.isLetterInWord()
        rightGuess.text = "Right Guess: \(Brain.rightGuess.compactMap{String($0)}.joined(separator: ", "))"
        wrongGuess.text = "Wrong Guess: \(Brain.wrongGuess.compactMap{String($0)}.joined(separator: ", "))"
        wordDisplay.text = String(Brain.displayWord.compactMap{String($0)}.joined(separator: " "))
        strikeImageDisplay.image = Brain.strikeImageUpdater()
        strikeNumDisplay.text = "Strike " + Brain.strikeCounter.description + "/7"
        checkForGameOver()
    }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField == guessTF {
        return true
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
    // https://grokswift.com/uitextfield/ this source helped me with this section
        if string.rangeOfCharacter(from: CharacterSet.letters, options: .caseInsensitive) != nil || (string == "" && range.length > 0) {
            return guessTF.text!.count < 1
        } else {
        return false
        }
    }
}

