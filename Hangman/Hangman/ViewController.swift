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
  internal func textFieldShouldReturn(_ textField: UITextField) -> Bool{
    textField.resignFirstResponder()
    if textField != nil {
      hangManBrain.hiddenWord = textField
      print("This is the hiddenWord: \(hangManBrain.hiddenWord.text!)")
    } else if textField != nil {
     hangManBrain.letterByUser = textField
      print("This is the hiddenWord: \(hangManBrain.letterByUser.text!)")


    }
    return true
    
    
    
    
  }
  
  internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
//    print(textField.text ?? "")
    return true
  }
  
//  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//    let currentText = textField.text ?? ""
//    guard let stringRange = Range(range, in: currentText) else {return false}
//    let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//    return updatedText.count <= 1
//  }
  
  
}

