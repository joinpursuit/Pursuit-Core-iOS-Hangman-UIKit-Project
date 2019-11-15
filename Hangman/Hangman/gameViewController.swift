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
    @IBOutlet weak var hangedManIV: UIImageView!
    
    //var securedWord = ""
    var guessCharInWord = ""
    
    let hangManGame = HangManLogic()
        
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //set delegate to securedWordTF

    securedWordTF.delegate = self
    guessWordTF.delegate = self
    hiddenSecuredWordLabel.isHidden = true
    guessWordTF.isEnabled = false
    hangedManIV.isHidden = true
  }

    @IBAction func newGameButton(_ sender: UIButton) {
        hangManGame.resetGame()
        restartGame()
    }
    
    //helper funcs
    func disableGame(){
        securedWordTF.isEnabled = false
        guessWordTF.isEnabled = false
    }
    
    func restartGame(){
        securedWordTF.isEnabled = true
        guessWordTF.isEnabled = true
        securedWordTF.text = nil
        hiddenSecuredWordLabel.text = hangManGame.showHiddenWord()
    }
        
}

extension gameViewController:UITextFieldDelegate{
    
    
    //function for return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == securedWordTF {
            hangManGame.word = securedWordTF.text!.lowercased()
            hiddenSecuredWordLabel.text = hangManGame.showHiddenWord()
            hiddenSecuredWordLabel.isHidden = false
            securedWordTF.isEnabled = false
            guessWordTF.isEnabled = true
            hangedManIV.isHidden = false
            hangedManIV.image = hangManGame.showHangedMan()
            
        } else if textField == guessWordTF{
            
            //insert series of char onto set property of HangManLogic
            hangManGame.guessedChars.insert(guessWordTF.text!.lowercased())
            hiddenSecuredWordLabel.text = hangManGame.showHiddenWord()
            if !hangManGame.word.contains(guessCharInWord){
                hangManGame.decrementGuess()
                userFeedBackLabel.text = "You have \(hangManGame.guessesLeft) guesses remaining"
            }
            
            //check to see if player won game or if all attempts are lost
            if hangManGame.didPlayerWon() == true{
                userFeedBackLabel.text = "You won with \(hangManGame.guessesLeft) guesses remaining"
                disableGame()
            } else if hangManGame.isGameEnd() == true{
                userFeedBackLabel.text = "YOU LOST."
                disableGame()
            }
            hangedManIV.image = hangManGame.showHangedMan()
            print(hangManGame.isGameEnd())
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

        //can never delete after typing char
        
        if textField == securedWordTF{
            print(string)
            if string == ""{
                return true
            } else if !Character(string).isLetter /*|| Character(string).isUppercase*/{
                return false
            }
        }
        else if textField == guessWordTF{
            //checks to see if user enters anything other than letters, delete key, or beyond the count of guessWord being one
            guessCharInWord = currentText.lowercased()
            print("String:", string)
            print("GuessWord:", guessCharInWord)
            print("Guess word count: ", guessCharInWord.count)
            
            //checks to see if user already guessed a certain char
            if guessCharInWord.contains(where: {!$0.isLetter}) || string == "" || guessCharInWord.count > 1 || hangManGame.guessedChars.contains(string) /*|| Character(string).isUppercase*/{
                return false
            }
        }
        return true
    }
}

