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
    
    //disable game inputs
    func disableGame(){
        securedWordTF.isEnabled = false
        guessWordTF.isEnabled = false
    }
    
    //restart game and enable inputs
    func restartGame(){
        securedWordTF.isEnabled = true
        guessWordTF.isEnabled = false
        securedWordTF.text = nil
        hiddenSecuredWordLabel.text = hangManGame.showHiddenWord()
        userFeedBackLabel.text = "Guess by entering a letter below"
        hangedManIV.image = hangManGame.showHangedMan()
        
    }
        
}

//Delegate methods
extension gameViewController:UITextFieldDelegate{
    
    
    //function for return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        // word text field
        if textField == securedWordTF {
            
            //word is sent to HangManLogic Class to be evaluated amongst their methods
            hangManGame.word = securedWordTF.text!.lowercased()
            
            //label is given hidden word with each char replaced with "_"
            hiddenSecuredWordLabel.text = hangManGame.showHiddenWord()
            
            //UI Elements updated to reflect user needs for inputs and feedback
            hiddenSecuredWordLabel.isHidden = false
            securedWordTF.isEnabled = false
            guessWordTF.isEnabled = true
            hangedManIV.isHidden = false
            hangedManIV.image = hangManGame.showHangedMan()
            
        }
            
        //guess word text field
        else if textField == guessWordTF{
            
            //insert series of char onto set property of HangManLogic lowercased
            hangManGame.guessedChars.insert(guessWordTF.text!.lowercased())
            
            //label is updated everytime the user returns a char in guessWordTF
            hiddenSecuredWordLabel.text = hangManGame.showHiddenWord()
            
            //checks to see if users char is contained
            if !hangManGame.word.contains(guessCharInWord){
                //decrement num of guesses and reflect how manu guesses are left
                hangManGame.decrementGuess()
                userFeedBackLabel.text = "You have \(hangManGame.guessesLeft) guesses remaining"
            }
            
            //check to see if player won game or if all attempts are lost, if so game is disabled
            if hangManGame.didPlayerWon() == true{
                userFeedBackLabel.text = "You won with \(hangManGame.guessesLeft) guesses remaining"
                disableGame()
            } else if hangManGame.isGameEnd() == true{
                userFeedBackLabel.text = "YOU LOST."
                disableGame()
            }
            
            //image is updated last to reflect the number of guesses remaining AFTER checking to see if the users char is contained across the word
            hangedManIV.image = hangManGame.showHangedMan()
            print(hangManGame.isGameEnd())
            //guess Chars are returned to nil for better UX
            guessWordTF.text = nil
        }
        
        return true
    }
    
    //function for text fields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //old string of what the user typed
        guard let textFieldSelected = textField.text else {
            return false
        }
        
        //most updated string of whats inside a given textField
        let currentText = textFieldSelected + string

        //can never delete after typing char
        
        //char movement in securedWordTF
        if textField == securedWordTF{
            print(string)
            //user is allowed to delete char within text field
            if string == ""{
                return true
            //if char is a letter, user cant return it
            } else if !Character(string).isLetter /*|| Character(string).isUppercase*/{
                return false
            }
        }
            
        //char movement in guessWordTF
        else if textField == guessWordTF{
            //checks to see if user enters anything other than letters, delete key, or beyond the count of guessWord being one
            guessCharInWord = currentText.lowercased()
            print("String:", string)
            print("GuessWord:", guessCharInWord)
            print("Guess word count: ", guessCharInWord.count)
            
            //checks to see if user already guessed a certain char, delete key pressed, or if user enters more than one char and if so, disable ability to change chars
            if guessCharInWord.contains(where: {!$0.isLetter}) || string == "" || guessCharInWord.count > 1 || hangManGame.guessedChars.contains(string) /*|| Character(string).isUppercase*/{
                return false
            }
        }
        return true
    }
}

