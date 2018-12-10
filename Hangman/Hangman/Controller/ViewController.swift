//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secureText: UITextField!
    @IBOutlet weak var guessingText: UITextField!
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var blanksText: UILabel!
  
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    var alreadyGuessed = ""
    var blanks = ""
    var myIndex = 0
    var strikesCount = 0
    
//this is the function that is going to run first and it only runs once
  override func viewDidLoad() {
    super.viewDidLoad()
    secureText.delegate = self
    guessingText.delegate = self
    infoLabel.text = "Welcome to Hangman!"
  }

    @IBAction func newGame(_ sender: Any) {
        secureText.isEnabled = true
        guessingText.isEnabled = false
        secureText.text = ""
        strikesCount = 0
        blanksText.text = ""
        alreadyGuessed = ""
        blanks = ""
        myIndex = 0
        hangmanImage.image = nil
        infoLabel.text = "Welcome to Hangman!"
    }
    
}

extension ViewController: UITextFieldDelegate {
    //this function gets called ONLY when the user enters return.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var space = ""
        //textField.resignFirstResponder()
        switch textField {
        case secureText:
            if let safeWord = secureText.text?.lowercased() {
                for _ in safeWord {
                    blanks.append("_")
                }
                blanks.forEach {space += String($0) + " "}
                blanksText.text = space
                secureText.isEnabled = false
                guessingText.isEnabled = true
            }
            
        case guessingText:
            if let guessingLetter = guessingText.text?.lowercased() {
                print(guessingLetter)
                alreadyGuessed += guessingLetter
                if (secureText.text?.lowercased().contains(Character(guessingLetter)))! {
                    guard let aWord = secureText.text?.lowercased() else {return true}
                    for (index, char) in aWord.enumerated() {
                        let letter = Character(guessingText.text!.lowercased())
                        if char == letter {
                            infoLabel.text = "Good Guess!"
                            myIndex = index
                            let stringIndex = blanks.index(blanks.startIndex, offsetBy: myIndex)
                            blanks.remove(at: stringIndex)
                            blanks.insert(letter, at: stringIndex)
                            blanksText.text = blanks
                            
                        }
                    }
                } else {
                    strikesCount += 1
                    infoLabel.text = "Bad Guess!"
                    switch strikesCount {
                    case 1:
                        hangmanImage.image = UIImage(named: "hang1")!
                    case 2:
                        hangmanImage.image = UIImage(named: "hang2")!
                    case 3:
                        hangmanImage.image = UIImage(named: "hang3")!
                    case 4:
                        hangmanImage.image = UIImage(named: "hang4")!
                    case 5:
                        hangmanImage.image = UIImage(named: "hang5")!
                    case 6:
                        hangmanImage.image = UIImage(named: "hang6")!
                    case 7:
                        hangmanImage.image = UIImage(named: "hang7")!
                    default:
                        print("oops")
                    }
                }
                if secureText.text == blanksText.text {
                    infoLabel.text = "Congratulations! You win!"
                }
                
                if strikesCount == 7 {
                    guessingText.isEnabled = false
                    infoLabel.text = "you lose, the word was \(secureText.text)"
                }
                
            }
            
        default:
            print("not working")
            
        }
        guessingText.text = ""
        return true
    }
    
    
    //every time the user enters a letter, this function is called. THIS FUNCTION IS CALLED IN REAL TIME. you do not have to press return to have this function run, it runs with every letter entered
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidGuess = CharacterSet(charactersIn: alreadyGuessed)
        return guessingText.text!.count < 1 && (string.rangeOfCharacter(from: CharacterSet.letters,
        options: .caseInsensitive) != nil) && !(string.rangeOfCharacter(from: invalidGuess,
        options: .caseInsensitive) != nil)
    }
    
    
    
    
}
