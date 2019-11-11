//
//  GameViewController.swift
//  Hangman
//
//  Created by Cameron Rivera on 11/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    //MARK: Outlets and Properties of GameViewController
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var wordInputTextField: UITextField!
    @IBOutlet weak var letterGuessingTextField: UITextField!
    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var lettersGuessedLabel: UILabel!
    @IBOutlet weak var theHangedMan: UIImageView!
    var wholeText: String = ""
    var hangmanClass: HangmanLogic = HangmanLogic()
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navItem.title = "Single Player Game"
        wordInputTextField.delegate = self
        letterGuessingTextField.delegate = self
        wordInputTextField.placeholder = "Input word here."
        letterGuessingTextField.placeholder = "Input letter."
        someLabel.text = "Input a word to guess in the textfield above."
        theHangedMan.image = hangmanClass.printHangedMan()
        lettersGuessedLabel.text = "Guessed letters: \(hangmanClass.displayGuessedLetters())."
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(true)
        navItem.title = ""
        hangmanClass.cleanUp()
        theHangedMan.image = UIImage()
    }

}

extension GameViewController: UITextFieldDelegate{
    //MARK: Methods of TextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text else {
            return false
        }
        wholeText = textFieldText + string
        
        if textField == wordInputTextField{
            textField.isSecureTextEntry = true
        } else if textField == letterGuessingTextField{
            if wholeText.count > 1{
                someLabel.text = "Your guess should be a single letter."
                return false
            } else if hangmanClass.containedInSet(string){
                someLabel.text = "You have already guessed that letter."
                return false
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textFieldText = textField.text else{
            return false
        }
        
        if textField == wordInputTextField{
            hangmanClass.setTargetWord(textFieldText.lowercased())
            textField.isUserInteractionEnabled = false
            textField.isHidden = true
        }else if textField == letterGuessingTextField{
            hangmanClass.addToSet(textFieldText.lowercased())
            if !hangmanClass.correctGuess(textFieldText) {
                hangmanClass.decrementRemainingGuesses()
            }
            theHangedMan.image = hangmanClass.printHangedMan()
        }
        
        if hangmanClass.getGuessesLeft() > 0 && hangmanClass.winConditionMet(){
            someLabel.text = "You win!"
            lettersGuessedLabel.text = hangmanClass.displayGuessedLetters()
            textField.isUserInteractionEnabled = false
            textField.isHidden = true
        } else if hangmanClass.getGuessesLeft() > 0{
            someLabel.text = hangmanClass.displayWord()
            lettersGuessedLabel.text = hangmanClass.displayGuessedLetters()
        } else {
            someLabel.text = "Game Over. The correct word was: \(hangmanClass.getTargetWord())"
            textField.isUserInteractionEnabled = false
            textField.isHidden = true
        }
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
}
