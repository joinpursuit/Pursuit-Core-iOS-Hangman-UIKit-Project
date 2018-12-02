//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var word: String?
    @IBOutlet weak var displayWord: UILabel!
    @IBOutlet weak var singleCharacter: UITextField!
    @IBOutlet weak var hangManImage: UIImageView!
    @IBOutlet weak var alphabetBox: UILabel!
    @IBOutlet weak var winLooseLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var currentLetterSelected: UILabel!
    var wordBox = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        singleCharacter.delegate = self
        if let word = word {
            displayWord.text = word
        }
    }
}




// step 1: conform to UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //allows me to block a character or symbol
        print(textField.text ?? "")
        let chara = textField.text ?? " "
        wordBox.append(chara)
        if wordBox.count > 1 {
            let allowedChar = CharacterSet.letters
            let charaSet = CharacterSet(charactersIn: String())
            return  allowedChar.isSuperset(of: charaSet)
        }
        
        return true
        //false wont allow you to text anything
    }
    //step 2: implement methods as needed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()//dismiss keyBoard
        currentLetterSelected.text = singleCharacter.text ?? "lala"
        return true
    }
    
 
    
    
    
    func lol(){
        
    }
}


