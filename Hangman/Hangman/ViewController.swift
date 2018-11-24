//
//  ViewController.swift
//  Hangman
//
//  Created by Jane Zhu on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordTF: UITextField!
    @IBOutlet weak var guessTF: UITextField!
    @IBOutlet weak var wordDisplay: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var strikeImageDisplay: UIImageView!
    @IBOutlet weak var strikeNumDisplay: UILabel!
    @IBOutlet weak var rightGuess: UILabel!
    @IBOutlet weak var wrongGuess: UILabel!
    private var strikeCounter = 0
    override func viewDidLoad() {
    super.viewDidLoad()
    wordTF.delegate = self
    guessTF.delegate = self
    guessTF.isEnabled = false
  }
    func strikeImageUpdater() {
        strikeCounter += 1
        switch strikeCounter {
        case 1:
            strikeImageDisplay.image = StrikeData.strike1.image
        case 2:
            strikeImageDisplay.image = StrikeData.strike2.image
        case 3:
            strikeImageDisplay.image = StrikeData.strike3.image
        case 4:
            strikeImageDisplay.image = StrikeData.strike4.image
        case 5:
            strikeImageDisplay.image = StrikeData.strike5.image
        case 6:
            strikeImageDisplay.image = StrikeData.strike6.image
        case 7:
            strikeImageDisplay.image = StrikeData.strike7.image
        default:
            strikeImageDisplay.image = nil
        }
        strikeNumDisplay.text = "Strike " + strikeCounter.description + "/7"
    }
    
    func checkForGameOver() {
        
    }
    // need a gameOver func
    // need a newGame func
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == wordTF {
        Brain.theWord = textField.text!.lowercased()
        wordDisplay.text = Brain.displayUnderscores()
        guessTF.isEnabled = true
        strikeImageDisplay.isHidden = false
        strikeNumDisplay.isHidden = false
        return true
        }
        
        if textField == guessTF {
        Brain.guessLetter = textField.text!.lowercased()
        if Brain.checkLetter() {
            message.text = "\"\(Brain.guessLetter)\" : correct guess 😃"
            rightGuess.text = "Right Guess: \(String(Brain.rightChoice.flatMap{String($0)}))"
            wordDisplay.text = String(Brain.displayWord.flatMap{String($0)})
        } else {
            message.text = "\"\(Brain.guessLetter)\" : wrong guess 😨"
            wrongGuess.text = "Wrong Guess: \(String(Brain.wrongChoice.flatMap{String($0)}))"
            wordDisplay.text = String(Brain.displayWord.flatMap{String($0)})
            strikeImageUpdater()
            print(strikeCounter)
        }
    }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    // https://grokswift.com/uitextfield/ this source helped me with this section
        let characterSetAllowed = CharacterSet.letters
        if textField == wordTF {
            if let _ = string.rangeOfCharacter(from: characterSetAllowed, options: .caseInsensitive) {
                return true
            } else {
                return false
            }
    } else if textField == guessTF {
        let characterCountLimit = 1
        let startingLength = textField.text?.count ?? 0
        let lengthToAdd = string.count
        let lengthToReplace = range.length
        let newLength = startingLength + lengthToAdd - lengthToReplace
        return newLength <= characterCountLimit
    }
        return true
    }
    
    
}
