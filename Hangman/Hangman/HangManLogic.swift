//
//  HangManLogic.swift
//  Hangman
//
//  Created by Bienbenido Angeles on 11/14/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class HangManLogic{
    
    var guessedChars: Set<String> = []
    var guessesLeft = 6
    var word = ""
    
    //func to decrement guesses across object
    func decrementGuess(){
        guessesLeft -= 1
    }
    
    //func to show current status of word depending on chars guessed throughout each char of word. chars of word are "_" by default, unless found within set of guessedChars
    func showHiddenWord() -> String{
        var revealingWord = ""
        for char in word{
            if guessedChars.contains(String(char)){
                revealingWord += String(char)
            } else {
                revealingWord += "_ "
            }
        }
        return revealingWord
    }
    
    // func displays UIImage of hanged man depending on guesses remaining throughout object, cases depend on decrement func to work
    func showHangedMan() -> UIImage{
        switch guessesLeft{
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
    
    //func used to check if the player won
    func didPlayerWon() -> Bool{
        if word == self.showHiddenWord(){
            return true
        } else {
            return false
        }
    }
    
    //func used to check the overall game state
    func isGameEnd() -> Bool{
        if guessesLeft == 0 || word == self.showHiddenWord(){
            return true
        } else {
            return false
        }
    }
    
    //func used to reset the core logical components of the game
    func resetGame(){
        guessesLeft = 6
        word = ""
        guessedChars.removeAll()
    }
}
