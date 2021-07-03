//
//  Word.swift
//  Hangman
//
//  Created by Brendon Cecilio on 11/14/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum gameResult {
    case correct
    case incorrect
}

class Word {
    var word: String = ""
    var guessWord: [Character] = []
    var numberOfGuesses: Int = 0
    let alphabets: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")
    var NumOfGuesses = 6
    
    
    static func getDashes(word: String) -> [String] {
        let dashes: [String] = Array(repeating: "_", count: word.count)
        return dashes
    }
}
