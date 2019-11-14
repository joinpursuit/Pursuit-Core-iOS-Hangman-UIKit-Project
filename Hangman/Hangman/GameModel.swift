//
//  GameModel.swift
//  Hangman
//
//  Created by casandra grullon on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum GameResult {
    case correct
    case incorrect
}

class GameModel {
    var numOfGuessesWrong : Int
    var count : Int
    var indicies : Set<Int>
    var player1WordInput : String
    
    init(numOfGuessesWrong: Int, count: Int, indices: Set<Int>, player1WordInput: String){
        self.numOfGuessesWrong = numOfGuessesWrong
        self.count = count
        self.indicies = indices
        self.player1WordInput = player1WordInput
    }
    
    static func getDashes(word: String) -> [String] {
        let dashes = Array(repeating: "_", count: word.count)
        return dashes
    }
    
    static func winCondition() {
        
    }
    
    
}
