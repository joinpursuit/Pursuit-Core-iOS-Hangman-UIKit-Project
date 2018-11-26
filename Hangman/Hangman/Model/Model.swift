//
//  Model.swift
//  Hangman
//
//  Created by Biron Su on 11/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class Hangman {
    var answerArray = [String]()
    var guessArray = [String]()
    var badArray = [String]()
    var topTextField: String = ""
    var middleLabel: String = ""
    var badLabel: String = ""
    var tries: Int = 0
    var badTries: Int = 0
    var bottomTextField: Bool = false
    var gameDone: Bool = false
    var imageMan: UIImage = UIImage(named: "hang1")!
    func createArrays(a: String) {
        gameDone = false
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
                middleLabel = "You've already entered \(b)."
            } else {
                tries += 1
                for i in 0..<answerArray.count {
                    for _ in answerArray {
                        if answerArray[i] == b {
                            guessArray[i] = answerArray[i]
                            if guessArray == answerArray {
                                middleLabel = "Winner! The word is \(guessArray.compactMap{$0}.joined())!"
                                gameDone = true
                                break
                            }
                            middleLabel = guessArray.compactMap{$0}.joined(separator: " ")
                        }
                    }
                }
            }
        } else {
            if badArray.contains(b) {
                middleLabel = "You've already entered the letter \(b)."
            } else {
                tries += 1
                badTries += 1
                badArray.append(b)
                middleLabel = "Sorry, word doesn't contain the letter \(b)."
                badLabel = "Bad pile : \(badArray.compactMap{$0}.joined(separator: ", "))"
            }
        }
        if badTries > 1 && badTries < 7 {
            imageMan = UIImage(named: "hang\(badTries)")!
        } else if badTries == 7 {
            imageMan = UIImage(named: "hang\(badTries)")!
            middleLabel = "GAME OVER! The dude died."
            gameDone = true
        }
        
    }
    func reset() {
        answerArray = []
        guessArray = []
        middleLabel = "Hangman!"
        tries = 0
        badTries = 0
    }
}
