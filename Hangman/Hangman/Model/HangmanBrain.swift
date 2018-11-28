//
//  HangManBrain.swift
//  Hangman
//
//  Created by Jian Ting Li on 11/24/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class HangmanBrain {
    var word = ""
    var wordArr = [String]()
    
    var blankArr = [String]()
    var guessedLetters = [String]()
    
    var strikeNum = 0 //didset property to check for lose
    var hangmanPics = HangmanPic.getSet1()
    
    static let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    //characterSet = .upperCased
}
