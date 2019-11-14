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
    var numOfGuessesWrong : Int = 0
    var count : Int = 0
    var indicies : Set<Int> = []
    var player1WordInput : String = ""
    
    static func getDashes(word: String) -> [String] {
        var dashes = Array(repeating: "_", count: word.count)
        return dashes
    }

    static func winCondition(word: String) {

    }
    
    
}
