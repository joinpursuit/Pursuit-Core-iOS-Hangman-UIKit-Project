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
    var array: [Character] {
        return Array(Brain.theWord)
    }
    
    static var guessLetter: String = ""
    static var rightChoice: [String] = []
    static var wrongChoice: [String] = []
    
    static func displayUnderscores(from theWord: String) -> String {
        var displayStr: String = ""
        for _ in theWord {
            displayStr += "_ "
        }
       return displayStr
    }
    
    static func checkForLetter(is guessLetter: String, in theWord: String) -> String {
        var displayStr: String = ""
        if theWord.contains(guessLetter) && !rightChoice.contains(guessLetter) {
            rightChoice.append(guessLetter)
            displayStr = ""
            for letter in theWord {
                for guessLetter in rightChoice {
                    if String(letter) == guessLetter {
                        displayStr += "\(guessLetter) "
                    } else {
                        displayStr += "_ "
                    }
                }
            }
            print(guessLetter)
            print(rightChoice)
        } else {//need an else-if the rightChoice already contains the letter
            for letter in theWord {
                for guessLetter in rightChoice {
                    if String(letter) == guessLetter {
                        displayStr += "\(guessLetter) "
                    } else {
                        displayStr += "_ "
                    }
                }
            }
            print(guessLetter)
            print(rightChoice)
        }
        return displayStr
    }
    
    static func updateDisplay(replace guessLetter: String, in theWord: String) -> String {
        var displayStr: String = ""
        for letter in theWord {
            if String(letter) == guessLetter {
                displayStr += "\(guessLetter) "
            } else {
                displayStr += "_ "
            }
        }
        return displayStr
    }
    
}
