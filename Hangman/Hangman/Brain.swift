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
    static var theWordArr: [Character] {
        return Array(Brain.theWord)}
    static var displayWord: [String] = []
    static var guessLetter: String = ""
    static var rightChoice: [String] = []
    static var wrongChoice: [String] = []
    
    static func displayUnderscores() -> String {
        for _ in theWord {
            displayWord.append("_ ")
        }
       return String(displayWord.flatMap{String($0)})
    }
    
    static func checkLetter() -> Bool {
        if theWord.contains(guessLetter) {
            if !rightChoice.contains(guessLetter) {
            rightChoice.append(guessLetter)
            for (index, letter) in theWordArr.enumerated() {
                for guessLetter in rightChoice {
                    if String(letter) == guessLetter {
                        displayWord[index] = "\(String(letter)) "
                    }
                }
            }
            }
            return true
        } else {
            if !wrongChoice.contains(guessLetter) {
            wrongChoice.append(guessLetter)
            }
            return false
        }
    }
    
    static func checkForWin() {
        print("hello")
    }
    
}
