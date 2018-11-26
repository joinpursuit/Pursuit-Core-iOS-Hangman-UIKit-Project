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
    static var theWordArr: [String] = theWord.map{ String($0) }
    static var displayWord: [String] = []
    static var guessLetter = ""
    static var rightGuess: [String] = []
    static var wrongGuess: [String] = []
    
    static func displayUnderscores() -> String {
        for _ in theWord {
            displayWord.append("_ ")
        }
       return String(displayWord.flatMap{String($0)})
    }
    
    static func isLetterInWord() -> Bool {
        if theWord.contains(guessLetter) {
            if !rightGuess.contains(guessLetter) {
            rightGuess.append(guessLetter)
            for (index, letter) in theWordArr.enumerated() {
                for guessLetter in rightGuess {
                    if String(letter) == guessLetter {
                        displayWord[index] = "\(String(letter)) "
                    }
                }
            }
            }
            return true
        } else {
            if !wrongGuess.contains(guessLetter) {
            wrongGuess.append(guessLetter)
            }
            return false
        }
    }
    
}
