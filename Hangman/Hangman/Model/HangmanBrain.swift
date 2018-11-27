//
//  HangmanBrain.swift
//  Hangman
//
//  Created by Nathalie  on 11/24/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

public func returnBlanks(userInput: UITextField) -> String {
    var hiddenWord = ""
    for _ in userInput.text! {
        hiddenWord.append("-")
    }
    return hiddenWord
}
