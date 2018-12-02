//
//  HangManBrain.swift
//  Hangman
//
//  Created by Joshua Viera on 11/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class HangManBrain {
    
    var randomWord = String()
    var guessesLeft = Int()
    var userGuesses = [String]()
    var wins = Int()
    var losses = Int()
    var singleChar: Character = " "
    var wrongChar: Character = " "
    var alphabet = [Character]()
    var underScores = [String]()
    
//    init(randomWord: String,guessesLeft:Int,userGuesses: [String],wins: Int, losses: Int, singleChar: Character, wrongChar: Character,alphabet: [Character],underScores: [String]) {
//        self.alphabet = alphabet
//        self.randomWord = randomWord
//        self.guessesLeft = guessesLeft
//        self.losses = losses
//        self.singleChar = singleChar
//        self.wrongChar = wrongChar
//        self.underScores = underScores
//        self.userGuesses = userGuesses
//        self.wins = wins
//        return
//    }
    
    func getInfo() {
    }
}
