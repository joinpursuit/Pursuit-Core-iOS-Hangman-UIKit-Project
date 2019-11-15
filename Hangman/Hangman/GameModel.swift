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
    var count : Int = 0
    var indicies : Set<Int> = []
    var player1WordInput : String = ""
    
    
    static func getDashes(word: String) -> [String] {
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
    
    func generateLetters(guessed: String, player1: String, dashes: [String]) -> String {
        var usedLetter : Set<String> = []
        var indicies : Set <Int> = []
        var dashes = [String]()
        
        if player1.contains(Character(guessed)) {
            usedLetter.insert(guessed)
            for (index, char) in player1.enumerated() {
                if char == Character(guessed) {
                    indicies.insert(index)
                }
                for (index, _) in dashes.enumerated() {
                    if indicies.contains(index) {
                        dashes[index] = guessed
                    }
                }
                return dashes.joined(separator: " ")
            }
        }
        return dashes.joined(separator: " ")
    }
    
    
    func checkWin(guessed: String, player1: String, numWrong: Int) -> String {
        var message = ""
        var usedLetter: Set<String> = []
        var count = numWrong
        var player1Set: Set<String> = []
        
        if player1.contains(Character(guessed)) {
            usedLetter.insert(guessed)
        } else {
            count += 1
        }
        
        for char in player1 {
            player1Set.insert(String(char))
        }
        
        if player1Set.isSubset(of: usedLetter) {
            message = "You won!"
        } else {
            message = "You lost!"
        }
        return message
    }
    
    
}
