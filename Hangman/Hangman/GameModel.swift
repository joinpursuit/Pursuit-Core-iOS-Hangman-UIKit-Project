//
//  Brain.swift
//  Hangman
//
//  Created by Jane Zhu on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GameModel {
    var word: String = ""
    var currentGuess = ""
    var wordAsArr: [String] { return word.map{ String($0) } }
    var displayWordAsArr: [String] = []
    var rightGuessArr: [String] = []
    var wrongGuessArr: [String] = []
    var strikeCounter = 0
    var win: Bool = false
    static var onePlayerMode: Bool = false
    
    func getWord() -> String {
        if GameModel.onePlayerMode {
            return RandomWord.getWord()
        } else {
            return ""
        }
    }
    
    func strikeImageUpdater() -> UIImage {
        switch strikeCounter {
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
    
    func displayUnderscores() -> String {
        for _ in word {
            displayWordAsArr.append("_ ")
        }
        return displayWordAsArr.compactMap{String($0)}.joined(separator: " ")
    }
    
    func isLetterInWord() -> String {
        var returnStr = ""
        if word.contains(currentGuess) {
            if !rightGuessArr.contains(currentGuess) {
                rightGuessArr.append(currentGuess)
                for (index, letter) in wordAsArr.enumerated() {
                    for guessLetter in rightGuessArr {
                        if String(letter) == guessLetter {
                            displayWordAsArr[index] = String(letter)
                            returnStr = "\"\(guessLetter)\" is a correct guess 😃"
                            if wordAsArr == displayWordAsArr {
                                win = true
                                break
                            }
                        }
                    }
                }
            } else {
                returnStr = "You've already entered \"\(currentGuess)\"."
            }
        } else {
            if !wrongGuessArr.contains(currentGuess) {
                wrongGuessArr.append(currentGuess)
                returnStr = "\"\(currentGuess)\" is a wrong guess 😨"
                strikeCounter += 1
            } else {
                returnStr = "You've already entered \"\(currentGuess)\"."
            }
        }
        return returnStr
    }
    
    func reset() {
        word = getWord()
        currentGuess = ""
        displayWordAsArr.removeAll()
        rightGuessArr.removeAll()
        wrongGuessArr.removeAll()
        strikeCounter = 0
        win = false
    }

}
