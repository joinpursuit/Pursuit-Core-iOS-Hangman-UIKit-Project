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
      switch hangManBrain.counterFailedAttempts{
      case 7:
        hangImage.image = UIImage(named: Image.hang7.rawValue)
      case 6:
        hangImage.image = UIImage(named: Image.hang6.rawValue)
      case 5:
        hangImage.image = UIImage(named: Image.hang5.rawValue)
        
      case 4:
        hangImage.image = UIImage(named: Image.hang4.rawValue)
        
      case 3:
        hangImage.image = UIImage(named: Image.hang3.rawValue)
        
      case 2:
        hangImage.image = UIImage(named: Image.hang2.rawValue)
        
      case 1:
        hangImage.image = UIImage(named: Image.hang1.rawValue)
        
      default:
        print("You are done!")
      }
      
    }
    
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



//
//if textField == letterByUser {
//  let currentLetter = letterByUser.text ?? ""
//  guard let letterByuserRange = Range(range, in: currentLetter) else {return false}
//  print(letterByuserRange)
//  let updatedLetterByUser = currentLetter.replacingCharacters(in: letterByuserRange, with: string)
//  print(updatedLetterByUser)
//  isLetterRightLength = updatedLetterByUser.count <= hangManBrain.letterByUserLength
//
//} else if textField == hiddenWord {
//  let currentWord = hiddenWord.text ?? ""
//  guard let hiddenWordRange = Range(range, in: currentWord) else {return false}
//  let updatedWord = currentWord.replacingCharacters(in: hiddenWordRange, with: string)
//  isWordRightLength = updatedWord.count <= hangManBrain.hiddenWordLenght
//
//}
