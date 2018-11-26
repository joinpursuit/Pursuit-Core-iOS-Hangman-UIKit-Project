//
//  HangMan Brain.swift
//  Hangman
//
//  Created by Elizabeth Peraza  on 11/23/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


enum Image: String {
  case hang1 = "hang1"
  case hang2 = "hang2"
  case hang3 = "hang3"
  case hang4 = "hang4"
  case hang5 = "hang5"
  case hang6 = "hang6"
  case hang7 = "hang7"
  
  func setImage(hangPic: String) -> String {
    let imageTitle = self.rawValue
    
    return imageTitle
  }
  
}


class HangmanBrain {
  
  var hiddenWordLenght = 20
  var letterByUserLength = 1
  var instructions = """
  Player2: Enter letters below to guess the word.
  Letters to choose from:
  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
  """

  var hiddenWord = " "
  var letterByUser = " "
  var hiddenWordArray = [Character]()
  var lettersThatWereSelected = [String]()
  var counterFailedAttempts = 0
  var counterForGuesses = 0
  var indexForLetter = 0
  var arrayToDisplayRigthLetter = [Character]()
  
  func letsPlay(wordToGuess: String, letterGuess: String) -> Bool{
    
    var isTheGuessedLetterRight = Bool()

    self.lettersThatWereSelected.append(letterGuess)
    print("these are the letters selected so far: \(lettersThatWereSelected)")
    
    let blanks = String(repeating: "_", count: wordToGuess.count)
    arrayToDisplayRigthLetter = Array(blanks)
  
    hiddenWordArray = Array(wordToGuess)
    

    if wordToGuess.contains(letterGuess){
      isTheGuessedLetterRight = true
      let letterConvertedToCharacter = Character(letterGuess)

      for (index, element) in hiddenWordArray.enumerated(){
        if letterConvertedToCharacter == element{
         indexForLetter = index
          arrayToDisplayRigthLetter[index] = element
            print("This is the array with right letters: \(arrayToDisplayRigthLetter)")
          self.counterForGuesses += 1
          print("This is the counter for guess\(counterForGuesses)")
          continue
        }
      }
    } else {
      self.counterFailedAttempts += 1
      print("this is the counter for failed attempt: \(counterFailedAttempts)")
      isTheGuessedLetterRight = false
    }
  
    return isTheGuessedLetterRight
  }

}
