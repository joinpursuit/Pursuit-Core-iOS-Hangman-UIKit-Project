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
    
    var word = ""
    var wordArr = [String]()
    
    var blanksArr = [String]()
    var guessedLetters = [String]()
    
    var hangmanImages = Brain.getHangmanPics()
    var strikeNum = 0 {
        didSet{
            if strikeNum > 5 {
                //reveal the word
                //disable all textfields
                //update label
            }
        }
    }
    
    var playerWin = false {
        didSet {
            if playerWin {
                //update label the player wins
                //hide all textfields
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordTextField.delegate = self
        letterTextField.delegate = self
        
        //hide letterTextField,
        //set image to 1t hangman
        //set blank label text to an " "
        //set won or lost label to an " "
        //already guessed label to " "
        word = ""
        wordArr = [String]()
        
        blanksArr = [String]()
        guessedLetters = [String]()
        
        strikeNum = 0
        playerWin = false
       
        
    }
   
    @IBAction func newGame(_ sender: UIButton) {
        
        //hide letterTextField,
        //set image to 1t hangman
        //set blank label text to an " "
        //set won or lost label to an " "
        //already guessed label to " "
        
    }
    
}

extension ViewController : UITextFieldDelegate{
    //when the user press return (enter), this function calls
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //dismiss keyboard
        
        if textField == wordTextField {
            //capture word into var
            //create array of strings from word var
            //iterate through array to create array of blanks
            //update blanks label to display masked labels
            
            //clear the text in the wordTextField
            //Hide wordTextField
            //reveales letter textfield
        }
        
        if textField == letterTextField {
            //check if the letter is part of the word
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
            //make sure it's an alphabet
            //make sure user enters 1 letter
            return false
        }
        return true
    }
}
