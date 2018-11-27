//
//  ViewController.swift
//  Hangman
//
//  Created by Jane Zhu on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var instance = GameModel()

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
    
    @IBAction func newGame(_ sender: UIButton) {
        guessTF.text = ""
        strikeImageDisplay.image = instance.strikeImageUpdater()
        strikeNumDisplay.text = ""
        rightGuess.text = "Right Guess:"
        wrongGuess.text = "Wrong Guess:"
        if sender.tag == 0 {
            GameModel.onePlayerMode = true
            instance.reset()
//            instance.word = instance.getWord()
            wordTF.isHidden = true
            wordTF.isEnabled = false
            guessTF.isEnabled = true
            wordDisplay.text = instance.displayUnderscores()
            message.text = "Enter a guess letter."
        }
        if sender.tag == 1 {
            GameModel.onePlayerMode = false
            instance.reset()
            wordTF.text = ""
            wordTF.isHidden = false
            wordTF.isEnabled = true
            guessTF.isEnabled = false
            wordDisplay.text = "waiting for word input..."
            message.text = "Enter a word."
        }
        
        
    }

func checkForGameOver() {
    if instance.win {
        message.text = "YOU WIN 😃😃😃"
        guessTF.isEnabled = false
        strikeNumDisplay.text = "Choose a game mode to restart."
    }
    if instance.strikeCounter == 7 {
        message.text = "GAME OVER 😨😨😨"
        guessTF.isEnabled = false
        strikeNumDisplay.text = "The word is \"\(instance.word)\""
    }
}
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? true {
            return true
        }
        textField.resignFirstResponder()
        if textField == wordTF {
            instance.word = textField.text!.lowercased()
            wordDisplay.text = instance.displayUnderscores()
            message.text = "Enter a guess letter."
            guessTF.isEnabled = true
            wordTF.isEnabled = false
            return true
            }
    
        if textField == guessTF {
        instance.currentGuess = textField.text!.lowercased()
        message.text = instance.isLetterInWord()
        rightGuess.text = "Right Guess: \(instance.rightGuessArr.compactMap{String($0)}.joined(separator: ", "))"
        wrongGuess.text = "Wrong Guess: \(instance.wrongGuessArr.compactMap{String($0)}.joined(separator: ", "))"
        wordDisplay.text = String(instance.displayWordAsArr.compactMap{String($0)}.joined(separator: " "))
        strikeImageDisplay.image = instance.strikeImageUpdater()
        strikeNumDisplay.text = "Strike " + instance.strikeCounter.description + "/7"
        checkForGameOver()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: CharacterSet.letters, options: .caseInsensitive) != nil || (string == "" && range.length > 0) {
            return guessTF.text!.count < 1
        } else {
        return false
        }
    }
}

   // https://grokswift.com/uitextfield/ this source helped me with the UITextField section
