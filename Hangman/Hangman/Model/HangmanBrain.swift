//
//  HangManBrain.swift
//  Hangman
//
//  Created by Jian Ting Li on 11/24/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class HangmanBrain {
    static var word = ""
    static var wordArr = [String]()
    
    static var blankArr = [String]()
    static var guessedLettersArr = [String]()
    
    static var startingStrikeNum = 0
    static var hangmanPicsArr = HangmanPic.getSet1()
    
    static let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    //characterSet = .upperCased
}
