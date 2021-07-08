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
    var gameWon = false
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var badPile: UILabel!
    @IBOutlet weak var totalTries: UILabel!
    @IBOutlet weak var imageMan: UIImageView!
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
            bottomTextField.isEnabled = hangmanCalc.bottomTextField
            middleLabel.text = hangmanCalc.middleLabel
            topTextField.resignFirstResponder()
            return true
        } else if (textField == bottomTextField) {
            hangmanCalc.guessWord(b: bottomTextField.text?.lowercased() ?? "Not A String")
            middleLabel.text = hangmanCalc.middleLabel
            badPile.text = hangmanCalc.badLabel
            bottomTextField.text = ""
            bottomTextField.resignFirstResponder()
            totalTries.text = "Tries: \(hangmanCalc.tries) Strikes: \(hangmanCalc.badTries) / 7"
            gameWon = hangmanCalc.gameDone
            imageMan.image = hangmanCalc.imageMan
            if gameWon {
                bottomTextField.isEnabled = false
            }
            return true
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string.rangeOfCharacter(from: CharacterSet.letters) != nil) || (string == "" && range.length > 0){
            middleLabel.text = hangmanCalc.middleLabel
            return bottomTextField.text!.count < 1
        } else {
            middleLabel.text = "Enter alphabets only!"
            return false
        }
    }
    @IBAction func newGame (_ sender: UIButton) {
        hangmanCalc.reset()
        imageMan.image = hangmanCalc.imageMan
        topTextField.isEnabled = true
        topTextField.text = ""
        totalTries.text = "Tries: 0 Strikes: 0 / 7"
        badPile.text = hangmanCalc.badLabel
        middleLabel.text = hangmanCalc.middleLabel
        bottomTextField.isEnabled = false
        bottomTextField.text = ""
    }
}
