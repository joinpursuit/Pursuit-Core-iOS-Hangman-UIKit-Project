//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class gameViewController: UIViewController {
    
    @IBOutlet weak var securedWordTF: UITextField!
    @IBOutlet weak var hiddenSecuredWordLabel: UILabel!
    @IBOutlet weak var userFeedBackLabel: UILabel!
    @IBOutlet weak var guessWordTF: UITextField!
    
    var securedWord = ""
    var guessCharInWord = ""
    
    //bank of entered guesses
    var enteredGuesses = Set<String>()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //set delegate to securedWordTF
    securedWordTF.delegate = self
    guessWordTF.delegate = self
    hiddenSecuredWordLabel.isHidden = true
    guessWordTF.isEnabled = false
  }

    @IBAction func newGameButton(_ sender: UIButton) {
        
    }
    
    //helper funcs
    
    //func to change underscore label
    func returnHiddenWordToLabel(){
        hiddenSecuredWordLabel.text = String(repeating: "_ ", count: securedWord.count)
    }
    
}

extension gameViewController:UITextFieldDelegate{
    
    
    //function for return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == securedWordTF {
            securedWord = securedWordTF.text!
            returnHiddenWordToLabel()
            hiddenSecuredWordLabel.isHidden = false
            guessWordTF.isEnabled = true
            
        } else if textField == guessWordTF{
            
            enteredGuesses.insert(securedWord)
            guessWordTF.text = nil
        }
        
        return true
    }
    
    //function for text fields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let textFieldSelected = textField.text else {
            return false
        }
        
        let currentText = textFieldSelected + string

        if textField == securedWordTF{
            if !Character(string).isLetter{
                return false
            }
        }
        else if textField == guessWordTF{
            //checks to see if user enters anything other than letters, delete key, or beyond the count of guessWord being one
            guessCharInWord = currentText
            print("String:", string)
            print("GuessWord:", guessCharInWord)
            print("Guess word count: ", guessCharInWord.count)
            
            if guessCharInWord.contains(where: {!$0.isLetter}) || string == "" || guessCharInWord.count > 1 || enteredGuesses.contains(string){
                return false
            }
            //checks to see if user already guessed a certain char
        }
        return true
    }
}

