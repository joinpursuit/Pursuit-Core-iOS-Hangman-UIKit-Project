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
  var instructionFirstPlayer = "Player1: Enter a word for the second player to guess."
  var instructions = """
  Player2: Enter letters in the square below!
  Letters to choose from:
      a, b, c, d, e, f, g, h, i, j, k, l, m,
      n, o, p, q, r, s, t, u, v, w, x, y, z
  """
  
  var hiddenWord = ""
  var letterByUser = ""
  var hiddenWordArray = [Character]()
  var lettersThatWereSelected = [String]()
  var counterFailedAttempts = 0
  var counterForGuesses = 0
  var indexForLetter = 0
  var arrayToDisplayRigthLetter = [Character]()
  
  
  
  
  
  func settingImageToFailedAttempts(attemptNum: Int) -> UIImage {
    var hangmanImage = UIImage()
    
    switch attemptNum{
    case 7:
      hangmanImage = UIImage(named: Image.hang7.rawValue)!
    case 6:
      hangmanImage = UIImage(named: Image.hang6.rawValue)!
    case 5:
      hangmanImage = UIImage(named: Image.hang5.rawValue)!
      
    case 4:
      hangmanImage = UIImage(named: Image.hang4.rawValue)!
      
    case 3:
      hangmanImage = UIImage(named: Image.hang3.rawValue)!
      
    case 2:
      hangmanImage = UIImage(named: Image.hang2.rawValue)!
      
    case 1:
      hangmanImage = UIImage(named: Image.hang1.rawValue)!
      
    default:
      print("You are done!")
    }
    
    return hangmanImage
  }
  
  func letsPlay(wordToGuess: String?, letterGuess: String?) -> Bool{
    guard let word = wordToGuess,
    let letter = letterGuess else
    {return false}
    
    
    var isTheGuessedLetterRight = Bool()
    
    lettersThatWereSelected.append(letter.lowercased())
    
    
    print("these are the letters selected so far: \(lettersThatWereSelected)")
    
    let blanks = String(repeating: "_", count: word.count)
    arrayToDisplayRigthLetter = Array(blanks)
    
    hiddenWordArray = Array(word.lowercased())
    
    
    if word.lowercased().contains(letter.lowercased()){
      
      isTheGuessedLetterRight = true
      
      let letterConvertedToCharacter = Character(letter.lowercased())
      
      for (index, element) in hiddenWordArray.enumerated(){
        if letterConvertedToCharacter == element{
          indexForLetter = index
          arrayToDisplayRigthLetter[index] = element
          print("This is the array with right letters: \(arrayToDisplayRigthLetter)")
          counterForGuesses += 1
          print("This is the counter for guess\(counterForGuesses)")
          continue
        }
      }
    } else {
      counterFailedAttempts += 1
      print("this is the counter for failed attempt: \(counterFailedAttempts)")
      isTheGuessedLetterRight = false
    }
    
    
    
    return isTheGuessedLetterRight
  }
  
  
  public func concatonateWord (word:String, str: String) -> String {
    let strToCharacter = Character(str)
    var completeArray = [Character]()
    let hiddenWordArray = Array(word.lowercased())
    for (index, element) in hiddenWordArray.enumerated(){
      if strToCharacter == element{
        indexForLetter = index
        arrayToDisplayRigthLetter[indexForLetter] = element
        completeArray = arrayToDisplayRigthLetter
    
      }
    }
    
    let returnString = completeArray.map{ String($0) }.reduce("", +)
    return returnString.lowercased()
  }
  
  func clearAllFields() {
    
  }

}


