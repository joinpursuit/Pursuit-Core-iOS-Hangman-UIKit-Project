//
//  Model.swift
//  Hangman
//
//  Created by Biron Su on 11/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class Hangman {
    var answerArray = [Any]()
    var guessArray = [Any]()
    var topTextField: String = ""
    var middleLabel: String = ""
    var bottomTextField:Bool = false
    func createArrays(a: String) {
        for i in a {
            answerArray.append(i)
            guessArray.append("_")
        }
        middleLabel = guessArray.compactMap{$0 as? String}.joined(separator: " ")
        bottomTextField = true
    }
    func guessWord (b: String) {

    }
    func reset() {
        answerArray = []
        guessArray = []
    }
}
