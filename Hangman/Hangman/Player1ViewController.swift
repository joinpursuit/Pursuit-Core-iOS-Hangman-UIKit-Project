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
    
    var game = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1Text.delegate = self
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let player2Screen = segue.destination as? Player2ScreenViewController else {
            return
        }
        player2Screen.game = game
    }
}

extension Player1ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        player1Text.resignFirstResponder()
        game.player1WordInput = player1Text.text ?? ""
        return true
    }
    
}
