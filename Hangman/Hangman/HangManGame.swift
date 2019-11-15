//
//  hangManGame.swift
//  Hangman
//
//  Created by Juan Ceballos on 11/14/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum GuessResult: CaseIterable    {
    
    case correctGuess
    case IncorrectGuess
    case redundantGuess
}

struct HangManGame  {
    var hiddenWord: String
    
    var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
                    "n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    var usedLetters: Set<String>? = [] // optional if no letters gussed
    
    var chances = 6
    
    func hideWord() -> String {
        var wordToHide = ""
        for char in hiddenWord {
            wordToHide += "_ "
        }
        return wordToHide
    }
    
    func gameGuess(letterGuess: String) -> GuessResult  {
        let guessResult:GuessResult
        if hiddenWord.contains(letterGuess)   {
            guessResult = .correctGuess
        }
        else if usedLetters?.contains(letterGuess) ?? false   {
            guessResult = .redundantGuess
        }
        else    {
            guessResult = .IncorrectGuess
        }
        return guessResult
    }
}
