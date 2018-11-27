//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var theSecretWord = ""
    var secretWordLabelText = ""
    var score1 = 0
    var score2 = 0
    var onwPlayer = 0
    var twoPlayer = 0
    var countingNumberOfGame = 0
    var currentWordEnter = "Player 1"
    var currentWordGuesser = "Player 2"
    var secretWordArray = [Character]()
    var correctLetterGuesses = [Character]()
    var wrongLetterGuesses = [Character]()
    var allLetterGuesses = [Character]()
    var numberOfIncorrectLetters = 0
    var hangmanImages = [UIImage]()
    
    func loadImages() {
        let image1 = UIImage(named: "hang1")
        let image2 = UIImage(named: "hang2")
        let image3 = UIImage(named: "hang3")
        let image4 = UIImage(named: "hang4")
        let image5 = UIImage(named: "hang5")
        let image6 = UIImage(named: "hang6")
        let image7 = UIImage(named: "hang7")
        
        hangmanImages = [image1, image2, image3, image4, image5, image6, image7] as! [UIImage]
    }
    
    func disableEndOfGame() {
        letterGuess.isEnabled = false
        guessButtonOutlet.isEnabled = false
    }
    let theAlphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var correctLetter: UILabel!
    @IBOutlet weak var incorrectLetter: UILabel!
    @IBOutlet weak var listOfIncorrectLetters: UILabel!
    
    @IBOutlet weak var winnerOrLoser: UILabel!
    
    @IBOutlet weak var secretWord: UITextField!
    var buttonHasBennToach = false
    @IBOutlet weak var secretWordButtonOutlet: UIButton!
    @IBAction func secretWordButton(_ sender: UIButton) {
        //Reset all variables to restart the game
        secretWordArray = []
        correctLetterGuesses = []
        wrongLetterGuesses = []
        allLetterGuesses = []
        numberOfIncorrectLetters = 0
        self.secretWordLabelText = ""

        //Set the secret word
        theSecretWord = secretWord.text ?? ""
        for letter in theSecretWord {
            self.secretWordLabelText = self.secretWordLabelText + "_ "
            self.secretWordArray.append(letter)

        }
        self.correctLetter.text = secretWordLabelText
        secretWord.isEnabled = false
        letterGuess.isEnabled = true
        guessButtonOutlet.isEnabled = true
        secretWordButtonOutlet.isEnabled = false
        guessButtonOutlet.isEnabled = true

        winnerOrLoser.text = "\(currentWordGuesser), please enter a letter guess"

    }
    @IBOutlet weak var letterGuess: UITextField!
    @IBAction func texeField(_ sender: UITextField) {
        
    }
    
    
    @IBOutlet weak var guessButtonOutlet: UIButton!
    @IBAction func guessButton(_ sender: UIButton) {
        
        let guessInputText: String = letterGuess.text ?? ""
        letterGuess.text = ""
        if guessInputText.count == 1 && theAlphabet.contains(guessInputText) {
            let guessChar = Character(guessInputText)
            if allLetterGuesses.contains(guessChar){
                print("You already guessed \(guessInputText). Please guess a new letter.")
            } else if secretWordArray.contains(guessChar) {
                correctLetterGuesses.append(guessChar)
                allLetterGuesses.append(guessChar)
                secretWordLabelText = ""

                var remainingLettersToGuess = 0
                for letter in theSecretWord {
                    if correctLetterGuesses.contains(letter) {
                        secretWordLabelText = secretWordLabelText + String(letter) + " "
                    } else {
                        secretWordLabelText = secretWordLabelText + "_ "
                        remainingLettersToGuess = remainingLettersToGuess + 1
                    }
                }
                correctLetter.text = secretWordLabelText
                if remainingLettersToGuess == 0 {

                    winnerOrLoser.text = "\(currentWordGuesser), !You win this round!"
                    print("no more letters to guess! you won!")
                    score2 += 1
                    player2Score.text = "\(score2)"
                    guessButtonOutlet.isEnabled = false
                    letterGuess.isEnabled = false
                    
                } else {
                    print("You still need to guess \(remainingLettersToGuess) letters")
                }
                
            } else {
                allLetterGuesses.append(guessChar)
                wrongLetterGuesses.append(guessChar)
                listOfIncorrectLetters.text?.append(guessChar)
                listOfIncorrectLetters.text?.append(" ")
                numberOfIncorrectLetters = numberOfIncorrectLetters + 1
                if numberOfIncorrectLetters == 7 {
                    print("You entered too many wrong guesses. You lost! Enter a new word to play again.")
                    // you guessed too many incorrect letters!
                    winnerOrLoser.text = "\(currentWordGuesser),You lost! The secret word was:  \(theSecretWord)"
                    disableEndOfGame()
                } else {
                    hangmanImage.image = hangmanImages[numberOfIncorrectLetters]
                }
          }
        } else {
            print("That is not a valid guess. Please enter a single lowercase letter.")
        }
  }
    
    
    
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    
    func hidePlayerAndScore() {
        player1.isHidden = true
        player2.isHidden = true
        player1Score.isHidden = true
        player2Score.isHidden = true
    }
    

    @IBAction func playAgain(_ sender: UIButton) {
        secretWord.isEnabled = true
        secretWordButtonOutlet.isEnabled = true
        secretWord.text = ""
        hangmanImage.image = hangmanImages[0]
        listOfIncorrectLetters.text = ""
        correctLetter.text = ""
        winnerOrLoser.text = ""
        
        //counting the game
        countingNumberOfGame += 1
        print(countingNumberOfGame)
        
        if countingNumberOfGame % 2 == 0 {
            currentWordEnter = "Player 1"
            currentWordGuesser = "Player 2"
        } else {
            currentWordEnter = "Player 2"
            currentWordGuesser = "Player 1"
        }
        winnerOrLoser.text = "\(currentWordEnter), please enter a new secret word"
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secretWord.delegate = self
        letterGuess.delegate = self
        //guessButtonOutlet.isEnabled = false
        
        loadImages()
        listOfIncorrectLetters.text = ""
        winnerOrLoser.text = "\(currentWordEnter), please enter a secret word."
        
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        print("the word")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        print(textField.text ?? "")
        return true
    }
    
}
