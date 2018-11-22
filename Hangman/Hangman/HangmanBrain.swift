//
//  HangmanBrain.swift
//  Hangman
//
//  Created by Leandro Wauters on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class HangmanBrain {
    static var userWord = String()
    static var userGuess =  String()
    static var correct = 0
    static var rightLetter = String()
    static var alreadyChosen = [String]()
    static var allowedStrikes = 0



    static func checkWinner (a: String, b: String) {
        if a.contains(b) {
            print("contains")
    }
        
}
}
