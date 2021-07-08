//
//  TwoPlayerViewController.swift
//  Hangman
//
//  Created by Stephanie Ramirez on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TwoPlayerViewController: UIViewController {
    @IBOutlet weak var userInputTextField: UITextField!
    @IBOutlet weak var cohortTextField: UITextField!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var hangmanImage: UIImageView!
    
    var solve = ""
    var foundIndex = -1
    var strikeCount = 0
    var alreadyGuessed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInputTextField.delegate = self
        cohortTextField.delegate = self
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        userInputTextField.text = ""
        userInputTextField.isUserInteractionEnabled = true
        cohortTextField.isEnabled = false
        solve = ""
        guessLabel.text = ""
        alreadyGuessed = ""
        strikeCount = 0
        infoLabel.text = "Player one: Write a word in the top text field"
    }
}
extension TwoPlayerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var addedSpaces = ""
        textField.resignFirstResponder()
        if textField == userInputTextField {
            guard let word = userInputTextField.text?.lowercased() else {return true}
            guard word != "" else {return true}
            for _ in word {
                solve += "_"
            }
            infoLabel.text = "Player two: Guess the word!"
            solve.forEach {addedSpaces += String($0) + " "}
            guessLabel.text = addedSpaces
            userInputTextField.isUserInteractionEnabled = false
            cohortTextField.isEnabled = true
        }
        if textField == cohortTextField {
            guard let guess = cohortTextField.text?.lowercased() else {return true}
            guard guess != "" else {return true}
            if (userInputTextField.text?.lowercased().contains(Character(guess)))! {
                guard let word = userInputTextField.text?.lowercased() else {return true}
                for (index, char) in word.enumerated() {
                    infoLabel.text = "That's correct!"
                    let letter = Character(cohortTextField.text!.lowercased())
                    if char == letter {
                        foundIndex = index
                        let stringIndex = solve.index(solve.startIndex, offsetBy: foundIndex)
                        solve.remove(at: stringIndex)
                        solve.insert(letter, at: stringIndex)
                    }
                }
                solve.forEach { addedSpaces += String($0) + " " }
                guessLabel.text = addedSpaces
            } else {
                infoLabel.text = "That's a strike!"
                strikeCount += 1
                switch strikeCount {
                case 1:
                    hangmanImage.image = UIImage(named: "hang1")!
                case 2:
                    hangmanImage.image = UIImage(named: "hang2")!
                case 3:
                    hangmanImage.image = UIImage(named: "hang3")!
                case 4:
                    hangmanImage.image = UIImage(named: "hang4")!
                case 5:
                    hangmanImage.image = UIImage(named: "hang5")!
                case 6:
                    hangmanImage.image = UIImage(named: "hang6")!
                case 7:
                    hangmanImage.image = UIImage(named: "hang7")!
                default:
                    print("error")
                }
            }
            alreadyGuessed += guess
            alreadyGuessed += guess.uppercased()
        }
        if solve == userInputTextField.text?.lowercased() {
            cohortTextField.isEnabled = false
            infoLabel.text = "You won! The word was: \(userInputTextField.text!.lowercased())"
        }
        if strikeCount == 7 {
            cohortTextField.isEnabled = false
            infoLabel.text = "You lost! The word was: \(userInputTextField.text!.lowercased())"
        }
        cohortTextField.text = ""
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let characterSetNotAllowed = CharacterSet(charactersIn: alreadyGuessed)
        return cohortTextField.text!.count < 1 && (string.rangeOfCharacter(from: CharacterSet.letters, options: .caseInsensitive) != nil) && !(string.rangeOfCharacter(from: characterSetNotAllowed, options: .caseInsensitive) != nil)
    }
}

