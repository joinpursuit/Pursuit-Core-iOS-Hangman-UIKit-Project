//
//  HangmanBrain.swift
//  Hangman
//
//  Created by Leandro Wauters on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

struct HangmanBrain {
    static var userWordInput = String()
    static var userWordGuess = String()
    static var categoryRandomWord = String()
    static var correct = 0
    static var rightLetter = String()
    static var alreadyChosen = [String]()
    static var allowedStrikes = 0
    static var arrayOfImages = [String]()
    static var fontColor: [UIColor] = [#colorLiteral(red: 0.9427184463, green: 1, blue: 0.5265357494, alpha: 1),#colorLiteral(red: 1, green: 0.683965981, blue: 0.9692175984, alpha: 1),#colorLiteral(red: 0.6666424274, green: 0.9941070676, blue: 1, alpha: 1),#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)]
    static var fontColorNames = ["Yellow","Pink","Light Blue","White"]
    static var backgroundColor = ["greenBlackboard", "blackBlackboard"]
    static var backgroundImageName = ["animals", "countries", "sports", "colors", "days", "fellows", "random"]
    static var chosenBackgroundColor = String()
    static var chosenFontColor: UIColor?
    static var chosenCategory: String?


    static func transformWord (word: String) -> String {
        var replacedString = String()
        for letter in word {
            if HangmanBrain.rightLetter.contains(letter) {
                replacedString += String(letter)
            } else {
                replacedString += "_"
            }
            replacedString += " "
        }
    return replacedString
    }
    
    static func mainLogic (userWordInput: String, userWordGuess: String) -> Bool {
        var boolToReturn = Bool ()
        HangmanBrain.alreadyChosen.append(HangmanBrain.userWordGuess)
        if userWordInput.contains(userWordGuess){
            boolToReturn = true
            let captureChar = Character(userWordGuess)
            for character in userWordInput {
                switch character {
                case captureChar:
                    HangmanBrain.correct += 1
                    HangmanBrain.rightLetter.append(HangmanBrain.userWordGuess)

                default:
                    continue
                }
            }
        } else {
            
            HangmanBrain.allowedStrikes += 1
            boolToReturn = false
        }
       return boolToReturn
    }
    
    static func colorWasSelected (colorChosen: String, toBeShown: [UIButton], showPickerLabel: UILabel, showPicker: UIPickerView, labelShown: UILabel, buttons: [UIButton]) {
        
        HangmanBrain.chosenBackgroundColor = colorChosen
        labelShown.isHidden = !labelShown.isHidden
        toBeShown.forEach{$0.isHidden = !$0.isHidden}
        showPickerLabel.isHidden = !showPickerLabel.isHidden
        showPicker.isHidden = !showPicker.isHidden
        buttons.forEach{$0.setTitleColor(UIColor.gray, for: .disabled)}
    }
    
}

