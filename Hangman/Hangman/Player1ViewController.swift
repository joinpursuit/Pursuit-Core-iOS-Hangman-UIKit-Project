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
        player2Screen.wordInPlayLabel.text = player1Text.text ?? ""
    }
    
    @IBAction func player1TextAction(_ sender: Any) {
        player1Text.text = game.player1WordInput
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
        
        
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        player1Text.resignFirstResponder()
        return true
    }
    
}
