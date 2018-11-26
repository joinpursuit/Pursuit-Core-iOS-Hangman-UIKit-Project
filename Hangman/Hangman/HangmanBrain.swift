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
}


class HangmanBrain {
    var answerArray = [String]()
    var guessArray = [String]()
    var guessedLetters = [String]()
    var userInputWord: String = ""
    var guessingWord: String = ""
    var gameText: String = ""
    var wrongGuesses: Int = 0
    var gameOverImage = UIImage(named: HangmanImages.sixWrongGuess)!
    var inputLetter:Bool = false
    var gameDone: Bool = false
    func wordArray(a: String) {
        for i in a {
            answerArray.append(String(i))
            guessArray.append("_")
        }
        guessingWord = guessArray.compactMap{$0}.joined(separator: " ")
        inputLetter = true
    }
    func checkingWord (b: String) {
        if answerArray.contains(b) {
            if guessedLetters.contains(b) {
                gameText = "You've already picked this letter"
            } else {
                for i in 0..<answerArray.count {
                    for _ in answerArray {
                        if answerArray[i] == b {
                            guessArray[i] = answerArray[i]
                            if guessArray == answerArray {
                                gameText = "You Win"
                                gameDone = true
                                break
                            }
                            guessingWord = guessArray.compactMap{$0}.joined(separator: " ")
                        }
                    }
                }
            }
        } else {
            if guessedLetters.contains(b) {
                gameText = "You've already entered the letter \(b)."
            } else {
                wrongGuesses += 1
                guessedLetters.append(b)
                gameText = "Sorry, word doesn't contain the letter \(b)."
            }
        }
        if wrongGuesses > 0 && wrongGuesses < 6 {
            switch wrongGuesses {
            case 1:
                gameOverImage = UIImage(named: HangmanImages.oneWrongGuess)!
            case 2:
                gameOverImage = UIImage(named: HangmanImages.twoWrongGuess)!
            case 3:
                gameOverImage = UIImage(named: HangmanImages.threeWrongGuess)!
            case 4:
                gameOverImage = UIImage(named: HangmanImages.fourWrongGuess)!
            case 5:
                gameOverImage = UIImage(named: HangmanImages.fiveWrongGuess)!
            default:
                gameOverImage = UIImage(named: "Default Image")!
            }
        } else if wrongGuesses == 6 {
            gameOverImage = UIImage(named: HangmanImages.sixWrongGuess)!
            gameText = "You Lose"
            gameDone = true
        }
    }
    func reset() {
        answerArray = []
        guessArray = []
        wrongGuesses = 0
    }
}

