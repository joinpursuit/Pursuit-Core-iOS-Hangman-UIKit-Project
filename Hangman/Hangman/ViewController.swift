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
  
  
  @IBAction func beginPlay() {
    hangManBrain.beginPlay(hiddenWordArray: hangManBrain.hiddenWordArray, letterByUserTwo: hangManBrain.letterByUserTwo)
    displayRightChoices.text = "\(hangManBrain.blanks)"
    print(hangManBrain.blanks)
    
  }
  
  
  
}


extension ViewController: UITextFieldDelegate {
  
  //textFieldShouldReturn is called when the keyboard return key is pressed. This method is used to dismiss the keyboard
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    if textField == hiddenWord{
      hangManBrain.hiddenWord = textField
      hangManBrain.hiddenWordArray = hangManBrain.handleHiddenWord(wordToBeGuessed: hiddenWord)
      
      print("This is the hiddenWord: \(hangManBrain.hiddenWord.text!)")
    } else if textField == letterByUser{
      hangManBrain.letterByUser = textField
      hangManBrain.letterByUserTwo = hangManBrain.handleLetterByUser2(letter: letterByUser)
      print("This is the letter: \(hangManBrain.letterByUser.text!)")
    }
    
    return true
  }
  
  //shouldChange Character is called when the user types a new character in the text field or deletes an existing character. This method will also disallow the use of a certain character
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    if textField == hiddenWord {
      let currentLetter = letterByUser.text ?? ""
      guard let otherStringRange = Range(range, in: currentLetter) else {return false}
      let updatedLetterByUser = currentLetter.replacingCharacters(in: otherStringRange, with: string)
      return updatedLetterByUser.count <= hangManBrain.letterByUserLength
    } else if textField == letterByUser {
      let currentLetter = letterByUser.text ?? ""
      guard let otherStringRange = Range(range, in: currentLetter) else {return false}
      let updatedLetterByUser = currentLetter.replacingCharacters(in: otherStringRange, with: string)
      return updatedLetterByUser.count <= hangManBrain.letterByUserLength
    }
    
    return true
  }
  
  //is called when the clearButton is pressed
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    print("clear button pressed")
    return true
  }
  
  
  
  //  internal func textFieldShouldReturn(_ textField: UITextField) -> Bool{
  //    textField.resignFirstResponder()
  //    if textField == hiddenWord {
  //      hangManBrain.hiddenWord = textField
  //      print("This is the hiddenWord: \(hangManBrain.hiddenWord.text!)")
  //    } else if textField == letterByUser {
  //      hangManBrain.letterByUser = textField
  //      print("This is the letter: \(hangManBrain.letterByUser.text!)")
  //
  //    }
  //    return true
  //
  //  }
  //
  //  internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
  //
  //    let currentLetter = letterByUser.text ?? ""
  //    guard let otherStringRange = Range(range, in: currentLetter) else {return false}
  //    let updatedLetterByUser = currentLetter.replacingCharacters(in: otherStringRange, with: string)
  //    return updatedLetterByUser.count <= hangManBrain.letterByUserLength
  //  }
  
}

////called when editing is about to begin
//func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//  print("editing is about to begin")
//  return true
//}
////is called when editing has begun
//func textFieldDidBeginEditing(_ textField: UITextField) {
//  textField.backgroundColor = UIColor.gray
//  print("editing bagun")
//}
////is called when the editing is about to end
//func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//  print("editing about to end")
//  return true
//}
////is called when editing ended
//func textFieldDidEndEditing(_ textField: UITextField) {
//  print("editing ended")
//  textField.backgroundColor = UIColor.white
//}

