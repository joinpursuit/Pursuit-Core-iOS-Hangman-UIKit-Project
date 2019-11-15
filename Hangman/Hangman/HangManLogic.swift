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
    //var enteredGuesses = Set<String>()
    
    func decrementGuess() -> Int{
        guessesLeft -= 1
        return guessesLeft
    }
    
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
    
    func showHangedMan() -> UIImage{
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
}
