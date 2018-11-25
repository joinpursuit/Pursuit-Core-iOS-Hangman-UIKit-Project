//
//  Model.swift
//  Hangman
//
//  Created by Biron Su on 11/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class Hangman {
    var answerArray = [String]()
    var guessArray = [String]()
    var badArray = [String]()
    var topTextField: String = ""
    var middleLabel: String = ""
    var bottomTextField:Bool = false
    func createArrays(a: String) {
        for i in a {
            answerArray.append(String(i))
            guessArray.append("_")
        }
        middleLabel = guessArray.compactMap{$0}.joined(separator: " ")
        bottomTextField = true
    }
    func guessWord (b: String) {
        if answerArray.contains(b) {
            if guessArray.contains(b) {
                middleLabel = "You've already picked this letter"
                sleep(2)
                middleLabel = guessArray.compactMap{$0}.joined(separator: " ")
            }
            for i in 0..<answerArray.count {
                for _ in answerArray {
                    if answerArray[i] == b {
                        guessArray[i] = answerArray[i]
                        if guessArray == answerArray {
                            middleLabel = "Winner! The word is \(guessArray.compactMap{$0}.joined(separator: " "))"
                        }
                    }
                }
            }
            
        }
    }
    func reset() {
        answerArray = []
        guessArray = []
    }
}
