//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //outlets
    @IBOutlet weak var hangManImage: UIImageView! //picture
    @IBOutlet weak var singleCharInput: UITextField!//user input(this appends to either userguesses, singleChar & wrong Char
    
    //5 labels
    @IBOutlet weak var displayWord: UILabel!//randomWord + underscores
    @IBOutlet weak var alphabetBox: UILabel! //alphabet
    @IBOutlet weak var winLooseLabel: UILabel! //wins & losses
    @IBOutlet weak var score: UILabel! //wins
    @IBOutlet weak var guessesLeft: UILabel! //numberOfGuesses(on this page) & guesses left(in the brain)
    
    //variables
    var word: String?
    var wordBox = [Character]()
    var indexBox = [Int]()
    var hangManBrain = HangManBrain()
    var picture = HangManBrain.allPictures
    var alphabet = HangManBrain.alphabetCharBox.description
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //displayWord(1
        singleCharInput.delegate = self
        if let word = word {
            displayWord.text = word
        }
        
        //alphabetBox(2
        alphabetBox.text = alphabet
        //winLooseLabel(3
        winLooseLabel.text = ("wins:\(hangManBrain.wins) losses:\(hangManBrain.losses)")
        //gussesLeft(4
        guessesLeft.text = ("Guesses:\(hangManBrain.numberOfGuesses)")
        //score(5
        score.text = ("Score:\(hangManBrain.wins)")
        
        
        for (index, character) in hangManBrain.alphabet.enumerated(){
            wordBox.append(character)
            indexBox.append(index)
        }
        
        
    }
}





// step 1: conform to UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //allows me to block a character or symbol
        print(textField.text ?? "")
//        if wordBox.count > 1 {
//            let allowedChar = CharacterSet.letters
//            let charaSet = CharacterSet(charactersIn: String())
//            return  allowedChar.isSuperset(of: charaSet)
//        }
        
        return true
        //false wont allow you to text anything
    }
    //step 2: implement methods as needed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()//dismiss keyBoard
        guessesLeft.text = singleCharInput.text ?? "lala"
        return true
    }
    
    
    @IBAction func restartButton(sender: UIButton){
        displayWord.text = ""
        winLooseLabel.text = "wins:\(hangManBrain.wins), losses:\(hangManBrain.losses)"
        guessesLeft.text = "\(hangManBrain.numberOfGuesses) guesses left!"
        alphabetBox.text = alphabet.description
    }
    
    
    func lol(){
        
    }
}


