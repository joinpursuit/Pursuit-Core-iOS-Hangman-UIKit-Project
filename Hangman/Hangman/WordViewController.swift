//
//  WordViewController.swift
//  Hangman
//
//  Created by Brendon Cecilio on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {
    
    // MARK:- Outlets and Properties
    @IBOutlet weak var enteredWordTextField: UITextField!
    @IBOutlet weak var enteredWordButton: UIButton!
    
    var word = Word()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredWordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare(ForSegue: )")
        guard let GameViewController = segue.destination as? GameViewController else { 
            return
            
        }
        // gameWord variable contains player1 word
        GameViewController.gameWord = word
    }
    
    // MARK:- Methods and Actions
    func enteredWord() {
        }
    

}

extension WordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        word.word = enteredWordTextField.text ?? ""
        return true
    }
    
}
