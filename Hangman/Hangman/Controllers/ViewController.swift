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
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var wrong: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainScreen: UIView!
    @IBOutlet weak var mainScreenText: UILabel!
    @IBOutlet weak var winnerScreen: UILabel!
    @IBOutlet weak var letterChosen: UILabel!
    
  
    override func viewDidLoad() {
    super.viewDidLoad()
    userInputText.delegate = self
    user2InputText.delegate = self
    restartGame()
    
  }
    private func restartGame() {
        correct.text = "Correct: "
        wrong.text = "Wrong: "
        chosenWord.text = ""
        userInputText.isHidden = false
        userInputText.text = ""
        HangmanBrain.allowedStrikes = 0
        HangmanBrain.correct = 0
        HangmanBrain.rightLetter = String()
        HangmanBrain.alreadyChosen = [String]()
        image.image = UIImage (named: "Default Image")
        restartButton.isHidden = true
        winnerScreen.isHidden = true
        mainScreenText.text = "Choose a word"
        label.text = ""
    }
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        restartGame()
    }
    
    
    
    
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        HangmanBrain.userWordInput = userInputText.text!.lowercased()
        HangmanBrain.userWordGuess = user2InputText.text!.lowercased()
        var word = String()
        
        
        for _ in 0..<HangmanBrain.userWordInput.count {
            word += " _ "
        }
        chosenWord.text = word
        userInputText.isHidden = true
        mainScreen.isHidden = true
        
        if textField == user2InputText {
            
            if !HangmanBrain.alreadyChosen.contains(HangmanBrain.userWordGuess){
                if HangmanBrain.mainLogic(userWordInput: HangmanBrain.userWordInput, userWordGuess: HangmanBrain.userWordGuess) == true {
                    label.text = "Correct!"
                } else {
                    label.text = "Incorrect!"
                }

            } else {
                label.text = "Letter already Chosen"
                textField.text = ""
            }
            
        textField.text = ""
        image.image = UIImage(named: HangmanBrain.arrayOfImages[HangmanBrain.allowedStrikes])
        letterChosen.text = "Letters Chosen: \(HangmanBrain.alreadyChosen.joined(separator: " ").uppercased())"
            
            chosenWord.text =  HangmanBrain.transformWord(word: HangmanBrain.userWordInput)
        }
        
        correct.text = "Correct: \(HangmanBrain.correct)"
        wrong.text = "Wrong: \(HangmanBrain.allowedStrikes)"
        
        if HangmanBrain.correct == HangmanBrain.userWordInput.count {
            chosenWord.text = "\(HangmanBrain.userWordInput)"
            restartButton.isHidden = false
            mainScreen.isHidden = false
            winnerScreen.isHidden = false
            mainScreenText.text = "The Correct Word Is: \(HangmanBrain.userWordInput)"
            winnerScreen.text = "Won!"

            
        }
        if HangmanBrain.allowedStrikes == 7 {
           chosenWord.text = "\(HangmanBrain.userWordInput)"
            restartButton.isHidden = false
            mainScreen.isHidden = false
            winnerScreen.isHidden = false
            mainScreenText.text = "The Correct Word Is: \(HangmanBrain.userWordInput)"
            winnerScreen.text = "Lost!"

        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
        var boolToReturn = Bool()

        if user2InputText.text!.count > 1 {
            boolToReturn = false
        } else  if user2InputText.text!.count < 1{
            boolToReturn = true
        }

        
        let allowCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        
        return allowCharacters.isSuperset(of: characterSet) && boolToReturn
        
    }
    
    
}


