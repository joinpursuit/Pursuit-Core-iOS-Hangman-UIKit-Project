//
//  HangmanModel.swift
//  Hangman
//
//  Created by katty y marte on 12/18/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

struct Brain {
    public var hiddenWord : [String]
    public var strikes : Int {
        didSet{
            if strikes == 7 {
                playerLoss = true
            }
        }
    }
    public var guesses : Set<String>
    public var word : String
    public var playerLoss : Bool
    
    
    
    static let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
   func getHiddenWord ()-> String {
      return hiddenWord.joined(separator: " ")
    }
    
    func getStrikes()-> Int {
        return strikes
    }
    mutating func updateHiddenWord (letter : String) {
        let guessLetter = Character(letter)
        for (index, currentLetter) in word.enumerated(){
            if guessLetter == currentLetter {
                guesses.insert(letter)
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
    
    mutating func setHiddenWord( word : String ){
        //count of word dashes
       hiddenWord = Array(repeating: "_", count: word.count)
        
    }
    mutating func setWord (word : String){
        //put it in the purse
        self.word = word
    }
    func isLetterInTheWord (letter: String) -> Bool {
       return word.contains(letter)
    }
}

