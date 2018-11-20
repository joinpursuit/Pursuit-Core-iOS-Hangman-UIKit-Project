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
    
    private var theWord: String = ""
    
    override func viewDidLoad() {
    super.viewDidLoad()
    wordTF.delegate = self
    guessTF.delegate = self
  }

    private func displayLines(_ userWord: String) {
        var displayStr: String = ""
        for _ in displayStr {
            displayStr += "_ "
        }
        message.text = displayStr
    }
    
    
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    // https://grokswift.com/uitextfield/ this source helped me with this section
        let characterSetAllowed = CharacterSet.letters
        if textField == wordTF {
            if let _ = string.rangeOfCharacter(from: characterSetAllowed, options: .caseInsensitive) {
                theWord = textField.text!
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
