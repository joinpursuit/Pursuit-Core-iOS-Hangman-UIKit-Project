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
    var p1Wins = false
    var p2Wins = false
    
    func hideWord() -> String {
        var wordToHide = ""
        for char in hiddenWord {
            wordToHide += "_ "
        }
        return wordToHide
    }
    
    func revealLetter(letterGuess: String, hiddenWord: String) -> String {
        var wordtToReveal = hiddenWord
        var indexL = 0
        var revealedLetter = String()
        print(wordtToReveal)
        for (index, char) in self.hiddenWord.enumerated()  {
            if String(char) == letterGuess  {
                let startIndex = wordtToReveal.startIndex
                let offset = wordtToReveal.index(startIndex, offsetBy: indexL)
                wordtToReveal.remove(at: offset)
                wordtToReveal.insert(Character(letterGuess), at: offset)
                revealedLetter = wordtToReveal
                indexL += 2
            } else  {indexL += 2}
        }
        indexL = 0
        return revealedLetter
    }
    
    func gameGuess(letterGuess: String) -> GuessResult  {
        let guessResult:GuessResult
        
        if usedLetters?.contains(letterGuess) ?? false   {
            guessResult = .redundantGuess
        }
        else if hiddenWord.contains(letterGuess)  {
            guessResult = .correctGuess
        }
            
        else    {
            guessResult = .IncorrectGuess
        }
        return guessResult
    }
    
}
