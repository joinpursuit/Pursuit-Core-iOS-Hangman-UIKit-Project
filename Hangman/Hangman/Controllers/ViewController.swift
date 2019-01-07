//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var letterTextField: UITextField!
    
    @IBOutlet weak var blankSpaces: UILabel!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var winOrLossTrack: UILabel!
    @IBOutlet weak var wrongGuesses: UILabel!
    
    var word : String? = ""
    var wordArr = [String]()
    var letter : String? = ""
    
    var blanksArr = [String]()
    var guessedLetters = [String]()
    
    var hangmanImages = Brain.getHangmanPics()
    var strikeNum = 0 {
        didSet{
            if strikeNum > 5 {
                //reveal the word
                blankSpaces.text = "\(String(describing: wordTextField))"
                //disable all textfields
                wordTextField.isEnabled = false
                letterTextField.isEnabled = false
                //update label
                winOrLossTrack.text = "You hang"
            }
        }
    }
    
    var playerWin = false {
        didSet {
            if playerWin {
                //update label the player wins
                winOrLossTrack.text = "You Live Another Day"
                //hide all textfields
                wordTextField.isHidden = true
                letterTextField.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordTextField.delegate = self
        letterTextField.delegate = self
        
        //hide letterTextField,
        letterTextField.isHidden = true
        //set image to 1t hang()man
        imageDisplay.image = hangmanImages[0]
        //set blank label text to an " "
        blankSpaces.text = " "
        
        //set won or lost label to an " "
        winOrLossTrack.text = " "
        //already guessed label to " "
        wrongGuesses.text = " "
        
        word = ""
        wordArr = [String]()
        
        blanksArr = [String]()
        guessedLetters = [String]()
        
        strikeNum = 0
        playerWin = false
       
        
    }
   
    @IBAction func newGame(_ sender: UIButton) {
        
        wordTextField.isHidden = false
        //hide letterTextField,
        letterTextField.isHidden = true
        //set image to 1t hangman
        imageDisplay.image = hangmanImages[0]
        //set blank label text to an " "
        blankSpaces.text = ""
        //set won or lost label to an " "
        winOrLossTrack.text = ""
        //already guessed label to " "
        wrongGuesses.text = ""
        strikeNum = 0
        
    }
    
}

extension ViewController : UITextFieldDelegate{
    //when the user press return (enter), this function calls
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //dismiss keyboard
        resignFirstResponder()
        
        if textField == wordTextField {
            //capture word into var
            word = textField.text?.uppercased()
            
            //create array of strings from word var
            if let wordArray = word {
                wordArr = wordArray.map{String($0)}
            }
           
            //TODO:
            //iterate through array to create array of blanks
            for _ in wordArr {
                 blanksArr.append("_")
            }
            //update blanks label to display masked labels
            for _ in blanksArr {
                blankSpaces.text?.append("_")
                 blankSpaces.text?.append(" ")
            }
            
            letterTextField.isHidden = false
            letterTextField.text = ""
            //blankSpaces.text = ""
            //clear the text in the wordTextField
            wordTextField.text = ""
            //Hide wordTextField
            wordTextField.isHidden = true
            //reveales letter textfield
            
           
        }
        
        if textField == letterTextField {
            //check if the letter is part of the word
            if let unwrappedLetter = textField.text?.uppercased() {
                letter = unwrappedLetter
            }
            
            for element in wordArr {
                if element  == letter {
                    for _ in wordArr {
                    blankSpaces.text? = element
                 // letterTextField.text?.append(i)
                  winOrLossTrack.text = "\(letter) is part of the word"
                    }
                }else{
                    winOrLossTrack.text = "\(letter) is Strike\(strikeNum)"
                    imageDisplay.image = hangmanImages[0]
                    wrongGuesses.text?.append(element)
                    //wrongGuesses.
                    strikeNum += 1
                }
                
            }
            if blanksArr.joined() == wordTextField.text{
                playerWin = true
            }
                //if it's part of the word,
                    //reveal in the blanks
                    //update game status label ("there's this letter)
                //Otherwise,
                    //update game status label ("sorry, no such letter)
                    //update hangman pic
                    //increase strike num by 1
            //add the letter to the already guessed array
            //update already guessed label
            
            //check whether the blanks (when joined) is == to the word
                //if it's the same assign playerWin to True
        }
        
        
        return true
    }
    
    //as the user types in the textfield, this function calls
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if textField == letterTextField {
    //var letter = ""
    //make sure it's an alphabet
    //make sure user enters 1 letter
    let alphabet = Brain.alphabets
    let userEnteredletterField = letterTextField.text ?? ""
    guard let stringRange = Range(range, in: userEnteredletterField) else {return false}
        guard userEnteredletterField.count < 1  else {return false}
    //let alphabetLetter = alphabet.contains(userEnteredletterField)
    for i in alphabet {
        if userEnteredletterField == i {
            letter = userEnteredletterField.replacingCharacters(in: stringRange , with: string)
        }
    }
    
    
   }
    return true
 }
}
