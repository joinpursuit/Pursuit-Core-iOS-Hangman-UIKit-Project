//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hangManGame = HangManGame(hiddenWord: "")
    
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    @IBOutlet weak var secretWordLabel: UILabel!
    @IBOutlet weak var guessLetterLabel: UILabel!
    @IBOutlet weak var winnerLabel:  UILabel!
    @IBOutlet weak var hiddenWordLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player2TextField.isEnabled = false
        player2TextField.isHidden = true
        guessLetterLabel.isHidden = true
        secretWordLabel.isHidden = false
        player1TextField.delegate = self
        player2TextField.delegate = self
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        winnerLabel.text = "Winner:"
        hangmanImage.image = #imageLiteral(resourceName: "hang1")
        hangManGame.chances = 6
        player2TextField.resignFirstResponder()
        player2TextField.isEnabled = false
        player2TextField.isHidden = true
        guessLetterLabel.isHidden = true
        player1TextField.isEnabled = true
        player1TextField.isHidden = false
        player1TextField.text = ""
        hangManGame.hiddenWord = ""
        hiddenWordLabel.text = ""
        player2TextField.text = ""
        hangManGame.usedLetters = []
        hangManGame.p1Wins = false
        hangManGame.p2Wins = false
        secretWordLabel.isHidden = false
    }
    
    
}

extension ViewController: UITextFieldDelegate   {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == player1TextField    {
            
            if hangManGame.alphabet.contains(string) == false || string == "" {return false}
            
            guard let text = textField.text else {
                return false
            }
            
        }
        if textField == player2TextField    {
            
            if hangManGame.alphabet.contains(string) == false || string == "" {return false}
            
            guard let text = textField.text else {
                return false
            }
            
            let currentText = text + string
            let guessResult = hangManGame.gameGuess(letterGuess: string)
            
            switch guessResult {
            case .correctGuess:
                hiddenWordLabel.text = hangManGame.revealLetter(letterGuess: string, hiddenWord: hiddenWordLabel.text ?? "default")
                print(hiddenWordLabel.text ?? "default")
                let wordToCheck = hiddenWordLabel.text?.replacingOccurrences(of: " ", with: "") ?? "default"
                if wordToCheck == hangManGame.hiddenWord    {
                    hangManGame.p1Wins = true
                }
                print("Correct")
                print(wordToCheck)
            case .IncorrectGuess:
                hangManGame.chances -= 1
                switch hangManGame.chances  {
                case 5:
                    hangmanImage.image = #imageLiteral(resourceName: "hang2")
                case 4:
                    hangmanImage.image = #imageLiteral(resourceName: "hang3")
                case 3:
                    hangmanImage.image = #imageLiteral(resourceName: "hang4")
                case 2:
                    hangmanImage.image = #imageLiteral(resourceName: "hang5")
                case 1:
                    hangmanImage.image = #imageLiteral(resourceName: "hang6")
                case 0:
                    hangmanImage.image = #imageLiteral(resourceName: "hang7")
                    hangManGame.p2Wins = true
                default:
                    print("default")
                }
                //print(hangManGame.chances)
                print("Incorrect")
            case .redundantGuess:
                print("redundant")
                return false
            }
            
            if hangManGame.p1Wins == true   {
                winnerLabel.text = "Winner: Player 1!"
                player2TextField.resignFirstResponder()
                player2TextField.text = ""
                player2TextField.isEnabled = false
                player2TextField.isHidden = true
                guessLetterLabel.isHidden = true
            }
                
            else if hangManGame.p2Wins == true  {
                winnerLabel.text = "Winner: Player 2!" + " \(hangManGame.hiddenWord)"
                player2TextField.resignFirstResponder()
                player2TextField.text = ""
                player2TextField.isEnabled = false
                player2TextField.isHidden = true
                guessLetterLabel.isHidden = true
            }
            
            hangManGame.usedLetters?.insert(string)
            print(hangManGame.usedLetters ?? "default")
            if currentText.count > 1   {
                textField.text = string
                return false
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == player1TextField {
            player1TextField.resignFirstResponder()
            player1TextField.isEnabled = false
            player1TextField.isHidden = true
            //player 1's word
            hangManGame.hiddenWord = player1TextField.text ?? "default"
            let hiddenWord = hangManGame.hideWord()
            secretWordLabel.isHidden = true
            hiddenWordLabel.text = hiddenWord
            
            player2TextField.isHidden = false
            player2TextField.isEnabled = true
            guessLetterLabel.isHidden = false
        }
        
        return true
    }
}
