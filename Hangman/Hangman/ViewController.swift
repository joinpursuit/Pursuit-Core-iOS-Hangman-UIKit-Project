//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userInputText: UITextField!
    @IBOutlet weak var chosenWord: UILabel!
    @IBOutlet weak var user2InputText: UITextField!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet var wrong: UILabel!
    

  override func viewDidLoad() {
    super.viewDidLoad()
    userInputText.delegate = self
    user2InputText.delegate = self
    correct.text = "Correct: "
    wrong.text = "Wrong"
  }


}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let captureWord = userInputText.text!
        let captureWord2 = user2InputText.text!
        var replacedString = String()
        var word = String()
        for _ in 0..<captureWord.count {
            word += " _ "
        }
        chosenWord.text = word
        userInputText.isUserInteractionEnabled = false
        
        if textField == user2InputText {
            if captureWord.contains(captureWord2){
                let captureChar = Character(captureWord2)
                for character in captureWord {
                    switch character {
                    case captureChar:
                        HangmanBrain.correct += 1
                        HangmanBrain.rightLetter.append(captureWord2)
                        HangmanBrain.alreadyChosen.append(captureWord2)
                        
                        for letter in captureWord {
                            if HangmanBrain.rightLetter.contains(letter) {
                                replacedString += String(letter)
                            } else {
                                replacedString += "_"
                            }
                            replacedString += " "
                        }
                        chosenWord.text = replacedString
                    default:
                        continue
                    }
                }
            } else {
                HangmanBrain.alreadyChosen.append(captureWord2)
                HangmanBrain.allowedStrikes += 1
                for letter in captureWord {
                    if HangmanBrain.rightLetter.contains(letter) {
                        replacedString += String(letter)
                    } else {
                        replacedString += "_"
                    }
                    replacedString += " "
                }
                chosenWord.text = replacedString

                

        }

        textField.text = ""
            if HangmanBrain.correct == captureWord.count {
                chosenWord.text = "WON!"
                
            }
            if HangmanBrain.allowedStrikes == 7 {
                chosenWord.text = "LOST"
            }
            switch HangmanBrain.allowedStrikes {
            case 1:
                Image.image = UIImage(named: "hang1")
                
            case 2:
                Image.image = UIImage(named: "hang2")
                
            case 3:
                Image.image = UIImage(named: "hang3")
                
            case 4:
                Image.image = UIImage(named: "hang4")
                
            case 5:
                Image.image = UIImage(named: "hang5")
                
            case 6:
                Image.image = UIImage(named: "hang6")
                
            case 7:
                Image.image = UIImage(named: "hang7")
                
            default:
                print("nothing")
                
            }
        }
        correct.text = "Correct: \(HangmanBrain.correct)"
        wrong.text = "Wrong: \(HangmanBrain.allowedStrikes)"
        return true
    }
    
    
}


