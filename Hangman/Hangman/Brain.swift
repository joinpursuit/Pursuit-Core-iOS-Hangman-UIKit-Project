//
//  Brain.swift
//  Hangman
//
//  Created by Jane Zhu on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class Brain {
    static var theWord: String = ""
    static var theWordArr: [String] { return theWord.map{ String($0) } }
    static var displayWord: [String] = []
    static var guessLetter = ""
    static var rightGuess: [String] = []
    static var wrongGuess: [String] = []
    static var strikeCounter = 0
    static var gameOver: Bool = false
    
    static func strikeImageUpdater() -> UIImage {
        switch Brain.strikeCounter {
        case 1:
            return StrikeData.strike1.image
        case 2:
            return StrikeData.strike2.image
        case 3:
            return StrikeData.strike3.image
        case 4:
            return StrikeData.strike4.image
        case 5:
            return StrikeData.strike5.image
        case 6:
            return StrikeData.strike6.image
        case 7:
            return StrikeData.strike7.image
        default:
            return StrikeData.strike0.image
        }
    }
    
    static func displayUnderscores() -> String {
        for _ in theWord {
            displayWord.append("_ ")
        }
       return String(displayWord.flatMap{String($0)})
    }
    
    
    static func isLetterInWord() -> String {
        var returnStr = ""
        if theWord.contains(guessLetter) {
            if !rightGuess.contains(guessLetter) {
            rightGuess.append(guessLetter)
            for (index, letter) in theWordArr.enumerated() {
                for guessLetter in rightGuess {
                    if String(letter) == guessLetter {
                        displayWord[index] = String(letter)
                        returnStr = "\"\(Brain.guessLetter)\" : correct guess 😃"
                        if theWordArr == displayWord {
                            print("I'm here")
                            Brain.gameOver = true
                            break
                        }
                    }
                }
            }
            } else {
                returnStr = "You've already entered \"\(Brain.guessLetter)\"."
            }
        } else {
            if !wrongGuess.contains(guessLetter) {
            wrongGuess.append(guessLetter)
                returnStr = "\"\(Brain.guessLetter)\" : wrong guess 😨"
                Brain.strikeCounter += 1
            } 
        }
        return returnStr
    }
    static func reset() {
        Brain.gameOver = false
        Brain.strikeCounter = 0
        Brain.displayWord.removeAll()
        Brain.rightGuess.removeAll()
        Brain.wrongGuess.removeAll()
        Brain.theWord = ""
    }

}
