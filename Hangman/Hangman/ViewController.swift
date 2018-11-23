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
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var label: UILabel!
    

  override func viewDidLoad() {
    super.viewDidLoad()
    userInputText.delegate = self
    user2InputText.delegate = self
    correct.text = "Correct: "
    wrong.text = "Wrong: "
    restartButton.isHidden = true
    chosenWord.text = ""
    label.text = ""
  }
    private func restartGame() {
        correct.text = "Correct: "
        wrong.text = "Wrong: "
        chosenWord.text = ""
        userInputText.isUserInteractionEnabled = true
        userInputText.text = ""
        HangmanBrain.allowedStrikes = 0
        HangmanBrain.correct = 0
        HangmanBrain.rightLetter = String()
        HangmanBrain.alreadyChosen = [String]()
        Image.image = UIImage (named: "Default Image")
        restartButton.isHidden = true
    }
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        restartGame()
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
            
            if !HangmanBrain.alreadyChosen.contains(captureWord2){
            
            if captureWord.contains(captureWord2){
                label.text = "Correct!"
                let captureChar = Character(captureWord2)
                for character in captureWord {
                    switch character {
                    case captureChar:
                        HangmanBrain.correct += 1
                        HangmanBrain.rightLetter.append(captureWord2)
                        HangmanBrain.alreadyChosen.append(captureWord2)
                    default:
                        continue
                    }
                }
            } else {
                HangmanBrain.alreadyChosen.append(captureWord2)
                label.text = "Incorrect"
                HangmanBrain.allowedStrikes += 1
        }
            } else {
                label.text = "Letter already Chosen"
                textField.text = ""
            }
            
        textField.text = ""
            
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
        
        correct.text = "Correct: \(HangmanBrain.correct)"
        wrong.text = "Wrong: \(HangmanBrain.allowedStrikes)"
        
        if HangmanBrain.correct == captureWord.count {
            chosenWord.text = "\(captureWord)"
            restartButton.isHidden = false
            label.text = "Won!"
            
        }
        if HangmanBrain.allowedStrikes == 7 {
           chosenWord.text = "\(captureWord)"
            restartButton.isHidden = false
            label.text = "Lost!"
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var boolToReturn = Bool()
        print(HangmanBrain.alreadyChosen)
        if user2InputText.text!.count > 1 {
            boolToReturn = false
        } else  if user2InputText.text!.count < 1{
            boolToReturn = true
        }
        return boolToReturn
    }
    
}


