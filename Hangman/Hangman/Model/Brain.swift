//
//  HangmanModel.swift
//  Hangman
//
//  Created by katty y marte on 12/18/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

struct Brain {
    var hiddenWord : [String]
    var strikes : Int {
        didSet{
            if strikes == 7 {
                playerLoss = true
            }
        }
    }
    var guesses : Set<String>
    var currentPlayer : Player
    var word : String
    var playerLoss : Bool
    
    
    
    static let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
   func getHiddenWord ()-> String {
      return hiddenWord.joined(separator: " ")
    }
    
    func getStrikes()-> Int {
        return strikes
    }
    mutating func updateWord (letter : String) {
        let guessLetter = Character(letter)
        for (index, currentLetter) in word.enumerated(){
            if guessLetter == currentLetter {
                hiddenWord[index] = currentLetter.description
            }
        }
    
    }
    mutating func updateStrikes (guessLetter: String) {
        if !word.contains(guessLetter){
            strikes += 1
        }
    }
    
    func getWord()-> String {
        return word
    }
    
}

