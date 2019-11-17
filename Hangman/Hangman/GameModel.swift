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
    var usedLetter: Set<Character> = []
    
    func getDashes(word: String) -> [String] {
        let dashes = Array(repeating: "_", count: word.count)
        return dashes
    }
    
    func checkAlreadyUsed(guessed: String) -> String {
        var message = ""
        
        for char in guessed {
            if usedLetter.contains(char) {
                message = "You already guessed that"
            } else {
                usedLetter.insert(char)
            }
        }
        
        return message
    }
    
    func generateLetters(guessed: String, player1: String) -> String {
        var index = 0
        
        for char in player1 {
            if guessed == String(char) {
                hiddenWord[index] = guessed
            }
            index += 1
            
        }
        return hiddenWord.joined(separator: " ")
    }
    
    
    func checkWin(guessed: String, player1: String) -> String {
        var message = ""
        var player1Set : Set<Character> = []
        
        for char in player1 {
            player1Set.insert(char)
        }
        
        for letter in guessed {
            if !player1.contains(letter) {
                numOfGuessesWrong += 1
            }
        }
        
        if hiddenWord.joined() == player1 {
            message = "You won!"
        }
        
        if numOfGuessesWrong == 6 {
            message = "You lost!"
        }
        return message
    }
    
}
