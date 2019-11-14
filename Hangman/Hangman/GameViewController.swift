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
    private var oneOrTwoPlayers: Bool = true // True for TwoPlayer Game and False for OnePlayer Game
    var hangmanClass: HangmanLogic = HangmanLogic()
    var categoryClassInstance: Category = Category() // Used in single player game
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        wordInputTextField.delegate = self
        letterGuessingTextField.delegate = self
        wordInputTextField.placeholder = "Input word here."
        letterGuessingTextField.placeholder = "Input letter."
        navItem.rightBarButtonItem?.title = "New Game"
        
        if oneOrTwoPlayers{
            navItem.title = "Two Player Game"
            someLabel.text = "Input a word to guess in the textfield above."
            hangmanClass.toggleTextField(letterGuessingTextField)
        } else {
            navItem.title = "Single Player Game"
            hangmanClass.toggleTextField(wordInputTextField)
            hangmanClass.setTargetWord(categoryClassInstance.targetWords[Int.random(in: 0..<categoryClassInstance.targetWords.count)].lowercased())
            someLabel.text = hangmanClass.displayWord()
        }
        theHangedMan.image = hangmanClass.printHangedMan()
        lettersGuessedLabel.text = "Guessed letters: \(hangmanClass.displayGuessedLetters())."
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(true)
        navItem.title = ""
        hangmanClass.cleanUp()
        theHangedMan.image = UIImage()
    }
    
    public func setOneOrTwoPlayers(_ set: Bool){
        self.oneOrTwoPlayers = set
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIBarButtonItem){
        hangmanClass.cleanUp()
        newSinglePlayerGame()
    }
    
    private func newSinglePlayerGame(){
        if navItem.title == "Single Player Game"{
        hangmanClass.setTargetWord(categoryClassInstance.targetWords[Int.random(in: 0..<categoryClassInstance.targetWords.count)].lowercased())
            hangmanClass.toggleTextField(letterGuessingTextField)
        } else if navItem.title == "Two Player Game" {
            hangmanClass.toggleTextField(wordInputTextField)
            hangmanClass.toggleTextField(letterGuessingTextField)
        }
        someLabel.text = hangmanClass.displayWord()
        theHangedMan.image = hangmanClass.printHangedMan()
        lettersGuessedLabel.text = "Guessed letters: \(hangmanClass.displayGuessedLetters())."
        letterGuessingTextField.text = ""
    }

}

extension GameViewController: UITextFieldDelegate{
    //MARK: Methods of TextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text else {
            return false
        }
        let char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        
        wholeText = textFieldText + string
        
        if textField == wordInputTextField{
            if isBackSpace == -92{
                return true
            }
            else if !Character(string).isLetter{
                someLabel.text = "You cannot input numbers or special characters."
                return false
            }
            textField.isSecureTextEntry = true
        } else if textField == letterGuessingTextField{
            if wholeText.count > 1{
                someLabel.text = "Your guess should be a single letter."
                return false
            } else if hangmanClass.containedInSet(string){
                someLabel.text = "You have already guessed that letter."
                return false
            } else if !Character(wholeText).isLetter{
                someLabel.text = "You cannot input numbers or special characters."
                return false
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textFieldText = textField.text?.lowercased() else{
            return false
        }
        if textFieldText == ""{
            return false
        } else if textField == wordInputTextField{
            hangmanClass.setTargetWord(textFieldText)
            hangmanClass.toggleTextField(textField)
            hangmanClass.toggleTextField(letterGuessingTextField)
        }else if textField == letterGuessingTextField{
            hangmanClass.addToSet(textFieldText)
            if !hangmanClass.correctGuess(textFieldText){
                hangmanClass.decrementRemainingGuesses()
            }
            theHangedMan.image = hangmanClass.printHangedMan()
        }
        
        if hangmanClass.getGuessesLeft() > 0 && hangmanClass.winConditionMet(){
            someLabel.text = "You win!"
            lettersGuessedLabel.text = hangmanClass.displayGuessedLetters()
            hangmanClass.toggleTextField(textField)
            lettersGuessedLabel.isHidden = true
        } else if hangmanClass.getGuessesLeft() > 0{
            someLabel.text = hangmanClass.displayWord()
            lettersGuessedLabel.text = hangmanClass.displayGuessedLetters()
        } else {
            someLabel.text = "Game Over. The correct word was: \(hangmanClass.getTargetWord())"
            hangmanClass.toggleTextField(textField)
        }
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
}
