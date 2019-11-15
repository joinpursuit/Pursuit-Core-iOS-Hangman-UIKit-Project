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
    @IBOutlet weak var player2Textfield: UITextField!
    @IBOutlet weak var secretWordLabel: UILabel!
    @IBOutlet weak var guessLetterLabel: UILabel!
    @IBOutlet weak var winnerLabel:  UILabel!
    @IBOutlet weak var hiddenWordLabel: UILabel!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        //hangmanImage.image = #imageLiteral(resourceName: "hang1")
        player2Textfield.isEnabled = false
        player2Textfield.isHidden = true
        guessLetterLabel.isHidden = true
        player1TextField.delegate = self
        player2Textfield.delegate = self
  }

}

extension ViewController: UITextFieldDelegate   {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == player2Textfield    {
            
            guard let text = textField.text else {
                return false
            }
            let currentText = text + string
            var guessResult = hangManGame.gameGuess(letterGuess: string)
            switch guessResult {
            case .correctGuess:
                print("Correct")
            case .IncorrectGuess:
                print("Incorrect")
            case .redundantGuess:
                print("redundant")
            }
            if currentText.count > 1    {
                textField.text = string
                return false
            }
            
            
            
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        player1TextField.resignFirstResponder()
        player1TextField.isEnabled = false
        player1TextField.isHidden = true
        //player 1's word
        hangManGame.hiddenWord = player1TextField.text ?? "default"
        let hiddenWord = hangManGame.hideWord()
        secretWordLabel.isHidden = true
        hiddenWordLabel.text = hiddenWord
    
        
        player2Textfield.isHidden = false
        player2Textfield.isEnabled = true
        guessLetterLabel.isHidden = false
        
        
        return true
    }
}
