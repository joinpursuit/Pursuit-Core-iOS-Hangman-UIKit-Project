//
//  HangmanLogic.swift
//  Hangman
//
//  Created by Cameron Rivera on 11/10/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class HangmanLogic{
    
    // MARK: Properties of Hangman Logic
    private var guessedWords: Set<String> = []
    private var guessesLeft: Int = 6
    private var targetWord: String = ""
    private var won: Bool = false
    
    //MARK: Initializers and Helper Methods
    
    
    //MARK: Methods of Hangman Logic
    func displayWord() -> String{
        var tempString: String = ""
        
        for char in self.targetWord{
            if guessedWords.contains(char.description){
                tempString += char.description
            } else {
                tempString += "_ "
            }
        }
        return tempString
    }
    
    func correctGuess(_ guess: String) -> Bool{
        var correct: Bool = false
        
        for char in targetWord{
            if char.description == guess{
                correct = true
            }
        }
        return correct
    }
    
    func printHangedMan() -> UIImage{
        switch self.guessesLeft{
        case 6:
            return #imageLiteral(resourceName: "hang1")
        case 5:
            return #imageLiteral(resourceName: "hang2")
        case 4:
            return #imageLiteral(resourceName: "hang3")
        case 3:
            return #imageLiteral(resourceName: "hang4")
        case 2:
            return #imageLiteral(resourceName: "hang5")
        case 1:
            return #imageLiteral(resourceName: "hang6")
        case 0:
            return #imageLiteral(resourceName: "hang7")
        default:
            return #imageLiteral(resourceName: "hang7")
        }
    }
    
    func oneTurn(_ guess: String){
        if !correctGuess(guess){
            guessesLeft -= 1
        }
    }
    
    func cleanUp(){
        guessedWords = []
        guessesLeft = 6
        targetWord = ""
        won = false
    }
    
    func displayGuessedLetters() -> String{
        return guessedWords.description
    }
    
    func getGuessesLeft() -> Int {
        return self.guessesLeft
    }
    
    func decrementRemainingGuesses(){
        if guessesLeft > 0{
            self.guessesLeft -= 1
        }
    }
    
    func addToSet(_ guess: String){
        self.guessedWords.insert(guess)
    }
    
    func setTargetWord(_ string: String){
        self.targetWord = string
    }
    
    func getTargetWord() -> String{
        return self.targetWord
    }
    
    func containedInSet(_ guess: String) -> Bool{
        return guessedWords.contains(guess)
    }
    
    func winConditionMet() -> Bool {
        won = true
        for char in targetWord{
            if !guessedWords.contains(char.description){
                won = false
            }
        }
        return won
    }
    
}
