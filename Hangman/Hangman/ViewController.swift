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
    @IBOutlet weak var hangImage: UIImageView!
    @IBOutlet weak var rightGuess: UILabel!
    @IBOutlet weak var wrongGuess: UILabel!
    override func viewDidLoad() {
    super.viewDidLoad()
    wordTF.delegate = self
    guessTF.delegate = self
    guessTF.isEnabled = false
  }
    func updateMessage(update label: UILabel, with arr: [String]) {
        var str = ""
        for letter in arr {
            str.append(letter)
        }
        label.text = str
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == wordTF {
        Brain.theWord = textField.text!
        wordDisplay.text = Brain.displayUnderscores(from: Brain.theWord)
        guessTF.isEnabled = true
        return true
        }
        
        if textField == guessTF {
        Brain.guessLetter = textField.text!
        wordDisplay.text = Brain.checkForLetter(is: Brain.guessLetter, in: Brain.theWord)
       // return true
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
