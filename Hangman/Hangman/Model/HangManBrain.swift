//
//  HangManBrain.swift
//  Hangman
//
//  Created by Joshua Viera on 11/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


class HangManBrain {
    
    var randomWord = String()
    var userGuesses = [String]()
    var underScores = [String]()
    var singleChar: Character = " "
    var wrongChar: Character = " "
    var alphabet = [Character]()
    var numberOfGuesses = 7
    var wins = Int()
    var losses = Int()
    var pictures = UIImage()
    
    
    static let allPictures = [UIImage(named: "hang1")!,UIImage(named:"hang2")!,UIImage(named:"hang3")!,UIImage(named:"hang4")!,UIImage(named:"hang5")!,UIImage(named:"hang6")!,UIImage(named:"hang7")!]
    
    static let alphabetCharBox: [Character] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
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
