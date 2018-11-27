//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secureText: UITextField!
    @IBOutlet weak var guessingText: UITextField!
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var blanksText: UILabel!
    @IBOutlet weak var guessedLetters: UILabel!
    @IBOutlet weak var strikes: UILabel!
    
//this is the function that is going to run first and it only runs once
  override func viewDidLoad() {
    super.viewDidLoad()
    secureText.delegate = self
    guessingText.delegate = self
  }


}

extension ViewController: UITextFieldDelegate {
    //this function gets called ONLY when the user enters return.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       secureText.resignFirstResponder()
        guessingText.resignFirstResponder()
        blanksText.text = returnBlanks(userInput: textField)
        return true
    }
    
    
    //every time the user enters a letter, this function is called. THIS FUNCTION IS CALLED IN REAL TIME. you do not have to press return to have this function run, it runs with every letter entered
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text ?? "") //if this text is nil, then it will return an empty string.
        //otherwise it will return what you entered.
        return true
    }
    
}
