//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hangManImage: UIImageView!
    
    @IBOutlet weak var user1WordInput: UITextField!
    
    
    @IBOutlet weak var user2LetterInput: UITextField!
    
    
    @IBOutlet weak var underscoredWordLabel: UILabel!
    
    
    @IBOutlet weak var resetGameButton: UIButton!
    
    var hMModel = HangManModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user1WordInput.delegate = self
        user2LetterInput.delegate = self
        
    }
    func incorrect() {
        if !hMModel.word.contains(hMModel.letter) {
            hMModel.guessMax -= 1
        }
    }
    func correctGuessedLetter() {
        for(index, char) in hMModel.word.enumerated() {
            if hMModel.letter == String(char) {
                hMModel.hiddenWordArray[index] = hMModel.letter
            }
            underscoredWordLabel.text = hMModel.hiddenWordArray.joined(separator: " ")
        }
    }
    
    func imageChange() {
        switch  hMModel.guessMax {
        case 6:
            hangManImage.image = UIImage(named: "hang1")
        case 5:
            hangManImage.image = UIImage(named: "hang2")
            case 4:
            hangManImage.image = UIImage(named: "hang3")
            case 3:
            hangManImage.image = UIImage(named: "hang4")
            case 2:
            hangManImage.image = UIImage(named: "hang5")
            case 1:
            hangManImage.image = UIImage(named: "hang6")
            case 0:
            hangManImage.image = UIImage(named: "hang7")
        default:
            hangManImage.image = UIImage(named: "hang1")
        }
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        //textField.text = ""
        if textField == user1WordInput {
            hMModel.word = user1WordInput.text?.lowercased() ?? ""
            
            underscoredWordLabel.text = hMModel.hiddenWord()
            
            
            
//            guard let unwrappedString = textField.text else { return false }
            textField.isHidden = true
            // print(hiddenWord.description)
        } else if textField == user2LetterInput {
            hMModel.letter = user2LetterInput.text?.lowercased() ?? ""
            correctGuessedLetter()
            incorrect()
            imageChange()
            print(hMModel.hiddenWordArray)
        }
        textField.text = ""
        return true
        
    }
    
    // this function determines what user CAN enter
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var alphabet = hMModel.alphabet
        //
        if textField == user2LetterInput { // If using user2LetterInput textfield
            if alphabet.contains(string.lowercased()) { //compares letter that was entered to the alphabet
                if user2LetterInput.text?.count == 1 {
                    return false
                }
            }
            return true
        } else if textField == user1WordInput {
            if alphabet.contains(string.lowercased()) {
                
                return true
            }
        }
        
        return false
    }
    
}
