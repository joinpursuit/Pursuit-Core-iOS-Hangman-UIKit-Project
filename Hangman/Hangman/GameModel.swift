//
//  GameModel.swift
//  Hangman
//
//  Created by casandra grullon on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

enum GameResult {
    case correct
    case incorrect
}

class GameModel {
    var numOfGuessesWrong : Int = 0
    var player1WordInput : String = ""
    var hiddenWord = [String]()
    
    
    func getDashes(word: String) -> [String] {
        let dashes = Array(repeating: "_", count: word.count)
        return dashes
    }
    
    func checkAlreadyUsed(guessed: String) -> String {
        let usedLetter : Set<String> = []
        var message = ""
        
        if usedLetter.contains(guessed) {
            message = "You already guessed that!"
        }
        return message
    }
    
    func generateLetters(guessed: String, player1: String) -> String {
        var index = 0

        for char in player1 {
            if char == Character(guessed) {
                hiddenWord[index] = String(char)
            } else {
                index += 1
            }
        }
        return hiddenWord.joined(separator: " ")
    }
    
    
    
    func checkWin(guessed: String, player1: String) -> String {
        var message = ""
        var usedLetter: Set<String> = []
        
        for letter in guessed {
        if player1.contains(letter) {
            usedLetter.insert(String(letter))
        } else {
            numOfGuessesWrong += 1
        }
        }
        
        if guessed == player1 {
            message = "You won!"
        }
        
        if numOfGuessesWrong == 6 {
            message = "You lost!"
        }
            
        
  return message
}
    
}
