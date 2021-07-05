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
  
  @IBOutlet weak var firstInstructions: UITextView!
  @IBOutlet weak var hangmanTitle: UILabel!
  @IBOutlet weak var hiddenWord: UITextField!
  @IBOutlet weak var hangImage: UIImageView!
  @IBOutlet weak var instructions: UITextView!
  @IBOutlet weak var letterByUser: UITextField!
  @IBOutlet weak var displayRightChoices: UILabel!
  @IBOutlet weak var displayAllChoices: UITextField!
  @IBOutlet weak var newGame: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    instructions.text = hangManBrain.instructions
    firstInstructions.text = hangManBrain.instructionFirstPlayer
    letterByUser.isUserInteractionEnabled = false
    letterByUser.delegate = self
    hiddenWord.delegate = self
  }
  
  func setUp() {
    hangManBrain.clearAllFields()
    letterByUser.delegate = self
    hiddenWord.delegate = self
    instructions.text = hangManBrain.instructions
    hangmanTitle.text = "Hang Man!"
    hangImage.image = nil
    displayAllChoices.text = ""
    displayRightChoices.text = ""
    letterByUser.isUserInteractionEnabled = false
    hiddenWord.isUserInteractionEnabled = true
    hiddenWord.text = ""
  }
  
  @IBAction func newGame(_ sender: Any) {
    setUp()
  }
}


extension ViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let isThereText = textField.text else { return false }
    guard !isThereText.isEmpty else { return false }
    
    textField.resignFirstResponder()
    
    
    if textField == hiddenWord{
      hangManBrain.hiddenWord = textField.text?.lowercased() ?? ""
      textField.clearButtonMode = .whileEditing
      print("This is the word: \(hangManBrain.hiddenWord)")
      letterByUser.isUserInteractionEnabled = true
      hiddenWord.isUserInteractionEnabled = false
      
    } else if textField == letterByUser{
      hangManBrain.letterByUser = textField.text?.lowercased() ?? ""
      print("This is the letter: \(hangManBrain.letterByUser)")
      textField.clearButtonMode = .whileEditing
      textField.text = ""
    }
    
    if hangManBrain.letsPlay(wordToGuess: hangManBrain.hiddenWord.lowercased(), letterGuess: hangManBrain.letterByUser.lowercased()){
      displayRightChoices.text = "\(hangManBrain.concatonateWord(word: hangManBrain.hiddenWord.lowercased(), str: hangManBrain.letterByUser.lowercased()))"
      
    } else {
     hangImage.image = hangManBrain.settingImageToFailedAttempts(attemptNum: hangManBrain.counterFailedAttempts)
    }
    
    displayAllChoices.text = "The letters you've entered are: \(hangManBrain.lettersThatWereSelected.joined(separator: " - "))"
    
    if hangManBrain.counterForGuesses == hangManBrain.hiddenWord.count{
      hangmanTitle.text = "You win!"
      hangmanTitle.textColor = UIColor.purple
      
      displayRightChoices.text = "The correct word is: \(hangManBrain.hiddenWord.uppercased())"
      letterByUser.isUserInteractionEnabled = false

    }
    
    if hangManBrain.counterFailedAttempts == 7{
      hangmanTitle.text = "You lose"
      hangmanTitle.textColor = UIColor.red
      displayRightChoices.text = "The word you didn't guess is: \(hangManBrain.hiddenWord.uppercased())"
      letterByUser.isUserInteractionEnabled = false

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

