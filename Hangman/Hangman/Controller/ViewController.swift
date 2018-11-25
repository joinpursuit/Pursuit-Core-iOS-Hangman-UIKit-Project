//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var hangmanCalc = Hangman()
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var middleLabel: UILabel!

    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var newGame: UIButton!
    override func viewDidLoad() {
    super.viewDidLoad()
        topTextField.delegate = self
        bottomTextField.delegate = self
        bottomTextField.isEnabled = false
  }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if (textField == topTextField) {
            hangmanCalc.createArrays(a: topTextField.text?.lowercased() ?? "Not A String")
            topTextField.isEnabled = false
            topTextField.text = "Word Added!"
            bottomTextField.isEnabled = hangmanCalc.bottomTextField
            middleLabel.text = hangmanCalc.middleLabel
            topTextField.resignFirstResponder()
            return true
        } else if (textField == bottomTextField) {
            hangmanCalc.guessWord(b: bottomTextField.text?.lowercased() ?? "Not A String")
            bottomTextField.text = ""
            bottomTextField.resignFirstResponder()
            return true
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let characters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
        if (string.lowercased().rangeOfCharacter(from: characters) == nil) {
            middleLabel.text = "Enter characters only!"
            return false
        } else {
            middleLabel.text = hangmanCalc.middleLabel
        }
        return bottomTextField.text!.count < 1 || string == ""
    }
    @IBAction func newGame (_ sender: UIButton) {
        topTextField.isEnabled = true
        topTextField.text = ""
        middleLabel.text = "HangMan!"
        bottomTextField.isEnabled = false
        bottomTextField.text = ""
        hangmanCalc.reset()
    }
}
