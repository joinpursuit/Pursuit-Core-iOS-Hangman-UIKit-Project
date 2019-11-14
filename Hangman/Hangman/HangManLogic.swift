////
////  HangManLogic.swift
////  Hangman
////
////  Created by Bienbenido Angeles on 11/14/19.
////  Copyright © 2019 Pursuit. All rights reserved.
////
//
//import Foundation
//
//
//
//
//class HangmanLogic {
//    //hangMan image
//    let hangManDrawing = ["""
//        -----|
//        |
//        |
//        |
//        |
//        |
//        --------
//        """,
//                                  """
//        -----|
//        |    O
//        |
//        |
//        |
//        |
//        --------
//        """,
//                                  """
//        -----|
//        |    O
//        |    |
//        |
//        |
//        |
//        --------
//        """,
//                                  """
//        -----|
//        |    O
//        |    |\\
//        |
//        |
//        |
//        ---------
//        """,
//                                  """
//        -----|
//        |    O
//        |   /|\\
//        |
//        |
//        |
//        ---------
//        """,
//                                  """
//        -----|
//        |    O
//        |   /|\\
//        |     \\
//        |
//        |
//        ---------
//        """,
//                                  """
//        -----|
//        |    O
//        |   /|\\
//        |   / \\
//        |
//        |
//        ---------
//        """
//            ]
//    
//    //var gameState = true
//    //var gameRestart = false
//    var repeatOnlyForAttempts = true
//    var numOfLosses = 0
//    var numOfAttemptsRemaining = 6
//    lazy var securedWord = ""
//    
//    //print out drawing
//    //print("hangManDrawing[numOfLosses]")
//
//    var dashesOfWord:[Character] = Array(repeating: "_", count: securedWord.count)
////    print(securedWord)
//    print(dashesOfWord)
//    func gameRestart() {
//        while numOfAttemptsRemaining == 0 || securedWord == String(dashesOfWord) {
//            print("GAME OVER")
//            print("Would you like to play again?, you can only enter \"yes\" or \"no\" for now")
//            let userInputPlayAgain = readLine() // gets player input if they want to play again or not
//            if let validUserInputPlayAgain = userInputPlayAgain{
//                if validUserInputPlayAgain.lowercased() == "yes" {
//                    //gameState = true
//                    Hangman()
//                } else if validUserInputPlayAgain.lowercased() == "no" {
//                    repeatOnlyForAttempts = false
//                    //gameState = false
//                    break
//                } else {
//                    print("Valid \"yes\" or \"no\" response not detected")
//                }
//            } else {
//                print("Nil response not detected")
//            }
//        }
//    }
//    
//    repeat {
//        //get character of what the user inputs
//        let userInputGuesses = readLine() ?? ""
//        
//        //switch underscores with the correct char at the correct index of dashesOfWord
//        if validAiWordAsString.contains(userInputGuesses) {
//            print(hangManDrawing[numOfLosses])
//            print("\(userInputGuesses) is a correct character for this word")
//            for (index, char) in validAiWordAsString.enumerated() {
//                    if char == Character(userInputGuesses){
//                        dashesOfWord[index] = char
//                        print(dashesOfWord)
//                    }
//            }
//            
//            if validAiWordAsString == String(dashesOfWord) {
//                print(hangManDrawing[numOfLosses])
//                print("YOU WON with \(numOfAttemptsRemaining) attempts remaining")
//                gameRestart()
//            }
//        }
//        
//        //Counts the number of attempts you have remaining
//        else if !validAiWordAsString.contains(userInputGuesses){
//            print("\(userInputGuesses) is a incorrect character for this word")
//            numOfAttemptsRemaining -= 1
//            numOfLosses += 1
//            print(hangManDrawing[numOfLosses])
//            print("You currently have \(numOfAttemptsRemaining) attempts remaining")
//            print(dashesOfWord)
//            if numOfAttemptsRemaining == 0 {
//                print("YOU LOST")
//                print("The word the computer choose was: \(validAiWordAsString)")
//                gameRestart()
//            }
//        }
//
////        print(userInputGuesses)
//
//        //If user loses the game print the word
//            //repeat this so long as user enters a yes or no response correctly
//        
//    } while repeatOnlyForAttempts
//    //game state restart
//}
