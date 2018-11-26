//
//  SinglePlayerViewController.swift
//  Hangman
//
//  Created by Leandro Wauters on 11/22/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit
import AudioToolbox

class SinglePlayerViewController: UIViewController {

//    var randomWord = HangmanBrain.allTheWords.randomElement()!
    var randomWord = Categories.categoryArray[Categories.categoryIndex].randomElement()!.lowercased()
    
    @IBOutlet weak var randowWord: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var wrong: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var user2InputText: UITextField!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var winnerScreen: UILabel!
    @IBOutlet weak var mainScreenText: UILabel!
    @IBOutlet weak var letterChosen: UILabel!
    @IBOutlet var font: [UILabel]!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var category: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(HangmanBrain.categoryRandomWord)
        restartButton.setBackgroundImage(UIImage(named: HangmanBrain.chosenBackgroundColor), for: .normal)
        backgroundImage.image = UIImage(named: HangmanBrain.chosenBackgroundColor)
        font.forEach{$0.textColor = HangmanBrain.chosenFontColor}
        user2InputText.delegate = self
        restartGame()
    }
    
    fileprivate func hideMainMenu(bool: Bool){
        let resultBool = bool
        restartButton.isHidden = resultBool
        winnerScreen.isHidden = resultBool
        mainScreenText.isHidden = resultBool
    }
    
    private func restartGame() {
        HangmanBrain.allowedStrikes = 0
        HangmanBrain.correct = 0
        correct.text = "Correct: 0"
        wrong.text = "Wrong: 0"
        randomWord = Categories.categoryArray[Categories.categoryIndex].randomElement()!.lowercased()
        HangmanBrain.rightLetter = String()
        HangmanBrain.alreadyChosen = [String]()
        randowWord.text = HangmanBrain.transformWord(word: randomWord)
        image.image = UIImage (named: "Default Image")
        hideMainMenu(bool: true)
        letterChosen.text = String()
        category.text = HangmanBrain.chosenCategory
        label.text = ""
        print(randomWord)
    }
    @IBAction func restart(_ sender: Any) {
        restartGame()
    }
    
}
extension SinglePlayerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        HangmanBrain.userWordGuess = user2InputText.text!.lowercased()
        
        if textField == user2InputText {
            
            if !HangmanBrain.alreadyChosen.contains(HangmanBrain.userWordGuess){
                if HangmanBrain.mainLogic(userWordInput: randomWord, userWordGuess: HangmanBrain.userWordGuess) == true {
                    label.text = "Correct!"
                } else {
                    label.text = "Incorrect!"
                    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                }
                
            } else {
                label.text = "Letter already Chosen"
                textField.text = ""
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            }
            
            textField.text = ""
            image.image = UIImage(named: HangmanBrain.arrayOfImages[HangmanBrain.allowedStrikes])
            randowWord.text = HangmanBrain.transformWord(word: randomWord)
            letterChosen.text = "Letters Chosen: \(HangmanBrain.alreadyChosen.joined(separator: " ").uppercased())"
            
        }
        
        correct.text = "Correct: \(HangmanBrain.correct)"
        wrong.text = "Wrong: \(HangmanBrain.allowedStrikes)"
        
        if HangmanBrain.correct == randomWord.count {
            hideMainMenu(bool: false)
            mainScreenText.text = "The correct word was: \(randomWord.uppercased())"
            winnerScreen.text = "Won!"
            
            
        }
        if HangmanBrain.allowedStrikes == 7 {
            hideMainMenu(bool: false)
            mainScreenText.text = "The correct word was: \(randomWord.uppercased())"
            winnerScreen.text = "Lost!"
            
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
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

