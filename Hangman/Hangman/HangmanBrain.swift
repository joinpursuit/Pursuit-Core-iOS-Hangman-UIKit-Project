//
//  HangmanBrain.swift
//  Hangman
//
//  Created by Matthew Huie on 11/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


public struct HangmanImages {
    static let defaultImage = "hang1"
    static let oneWrongGuess = "hang2"
    static let twoWrongGuess = "hang3"
    static let threeWrongGuess = "hang4"
    static let fourWrongGuess = "hang5"
    static let fiveWrongGuess = "hang6"
    static let sixWrongGuess = "hang7"
    static let youWin = "youWin"
}


class HangmanBrain {
    var guessedLetters = [String]()
    var userInputWord: String = ""
    var userInputLetter: String = ""
    var correctLetter: String = ""
    var guessingWord: String = ""
    var wrongGuesses: Int = 0
    var correctGuesses: Int = 0
    var gameOverImage = UIImage(named: HangmanImages.sixWrongGuess)!
    var gameDone: Bool = false
    
    
    func checkingWord (userWordInput: String, userWordGuess: String) -> Bool {
        var rightGuess = Bool()
        guessedLetters.append(userInputLetter)
        if userWordInput.contains(userWordGuess) {
            rightGuess = true
            let capChar = Character(userWordGuess)
            for letter in userWordInput {
                switch letter {
                case capChar:
                    correctGuesses += 1
                    correctLetter.append(userWordGuess)
                default:
                    continue
                }
            }
        } else {
            wrongGuesses += 1
            rightGuess = false
        }
        return rightGuess
    }
    
    func replaceDashes (word: String) -> String {
        var replacingString = String()
        for letter in word {
            if correctLetter.contains(letter) {
                replacingString += String(letter)
            } else {
                replacingString += "_"
            }
            replacingString += " "
        }
        return replacingString
    }
    
}

