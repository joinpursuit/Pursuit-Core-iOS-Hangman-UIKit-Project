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
  
  
  
  var hiddenWord = UITextField()
  var hiddenWordArray = [Character]()
  var letterByUserTwo: Character = " "
  var letterByUser = UITextField()
  var blanks = " "
  var blankArray = [Character]()
  var counterFailedAttempts = 0
  var counterForGuesses = 0
 var indexForLetter = 0
  var hangmanImage = UIImage(named: " ")

  
  func unwrappingResponse() {
    let userEnteredLetter = letterByUser.text?.lowercased() ?? " "
    switch userEnteredLetter.lowercased() {
    case "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z":
      counterForGuesses += 1
    default:
      print("Not a valid entry. Please try again.")
    }
  }
  
  func settingUpBlanks(word: UITextField){
    blanks = String(repeating: "_", count: word.text!.count)
    blankArray = Array(blanks)
  }
  
  func handleHiddenWord(wordToBeGuessed: UITextField) -> [Character] {
    let arrayWordToPlay: [Character] = Array(wordToBeGuessed.text ?? " ")
    return arrayWordToPlay
  }
  
  func handleLetterByUser2 (letter:UITextField) -> Character {
    let letterToCharacter = Character(letter.text ?? "!")
    return letterToCharacter
  }
    
  func beginPlay(hiddenWordArray: [Character], letterByUserTwo: Character) {

    if hiddenWordArray.contains(letterByUserTwo){
      print("hidden word contains letter")
      for (index, element) in hiddenWordArray.enumerated(){
        if letterByUserTwo == element{
          indexForLetter = index
          blankArray[indexForLetter] = element
          
        }
      }
    } else if !hiddenWordArray.contains(letterByUserTwo){
      counterFailedAttempts += 1
      switch counterFailedAttempts{
      case 5:
        hangmanImage = UIImage(named: "hang5")!
        
        print("")
        
      case 4:
        
        hangmanImage = UIImage(named: "hang4")!
        print("")
        
      case 3:
        hangmanImage = UIImage(named: "hang3")!
        print("")
        
      case 2:
        hangmanImage = UIImage(named: "hang2")!
        print("")
        
      case 1:
        hangmanImage = UIImage(named: "hang1")!
        print("")
        
      case 6:
        hangmanImage = UIImage(named: "hang6")!
        print ("The rigth word was: \(hiddenWord.text!.uppercased())")
        print("")
        
        counterFailedAttempts = 7
        
      default:
        print("You are doneso... 👻")
      }
    }
  }
}
