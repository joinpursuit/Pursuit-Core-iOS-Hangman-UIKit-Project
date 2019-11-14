//
//  ViewController.swift
//  Hangman
//
//  Created by casandra grullon on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class Player1ViewController: UIViewController {

    @IBOutlet weak var player1Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1Text.delegate = self
        
    }
    
    @IBAction func player1TextAction(_ sender: Any) {
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
    }
    
}

extension Player1ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        for char in string {
            
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}
