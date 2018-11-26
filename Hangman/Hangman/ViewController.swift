//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var hangManBrain = HangmanBrain()
  
  
  @IBOutlet weak var hangmanTitle: UILabel!
  @IBOutlet weak var hiddenWord: UITextField!
  @IBOutlet weak var hangImage: UIImageView!
  @IBOutlet weak var instructions: UITextView!
  @IBOutlet weak var letterByUser: UITextField!
  @IBOutlet weak var displayRightChoices: UILabel!
  @IBOutlet weak var newGame: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    instructions.text = hangManBrain.instructions
    letterByUser.delegate = self
    hiddenWord.delegate = self
  }
  
  
}


extension ViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let isThereText = textField.text else { return false }
    guard !isThereText.isEmpty else { return false }
    
    textField.resignFirstResponder()
    
    if textField == hiddenWord{
      hangManBrain.hiddenWord = textField.text ?? ""
      textField.clearButtonMode = .whileEditing
      print("This is the word: \(hangManBrain.hiddenWord)")
      
    } else if textField == letterByUser{
      hangManBrain.letterByUser = textField.text ?? ""
      print("This is the letter: \(hangManBrain.letterByUser)")
      textField.clearButtonMode = .whileEditing
      textField.text = ""
    }
    
    if hangManBrain.letsPlay(wordToGuess: hangManBrain.hiddenWord, letterGuess: hangManBrain.letterByUser) {
      displayRightChoices.text = "\(hangManBrain.arrayToDisplayRigthLetter)"
      
    } else {
      hangImage.image = hangManBrain.settingImageToFailedAttempts(attemptNum: hangManBrain.counterFailedAttempts)
    }
    
//    if function to lose is true -> disable all the buttons
    //update with lose message and word that was supposed to be guessed
//
//    if function to win is true -> disable all the buttons
//    update with win message and guessed word
//
    return true
  }
  
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentWord = hiddenWord.text ?? ""
        let currentLetter = letterByUser.text ?? ""
    
    var isWordRightLength = Bool()
    var isLetterRightLength = Bool()
    
    if currentLetter.count > 1{
      isLetterRightLength = false
    } else if currentLetter.count < 1 {
      isLetterRightLength = true
    }
    
    
    if currentWord.count < 20 {
      isWordRightLength = true
    } else {
      isWordRightLength = false
    }
    
    let allowedCharacters = CharacterSet.letters
    let characterSet = CharacterSet(charactersIn: string)
    
    
    return allowedCharacters.isSuperset(of: characterSet) && isWordRightLength && isLetterRightLength
    
  }
  
}


//I need to determine win and stop the game
//I need to determine que perdió and end the game
//I need to join the word at the end when displaying
//I need to restart the game


