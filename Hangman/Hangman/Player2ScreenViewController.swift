//
//  Player2ScreenViewController.swift
//  Hangman
//
//  Created by casandra grullon on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class Player2ScreenViewController: UIViewController {

    @IBOutlet weak var wordInPlayLabel: UILabel!
    @IBOutlet weak var player2Guesstf: UITextField!
    @IBOutlet weak var hangManImage: UIImageView!
    @IBOutlet weak var alreadyGuessedLabel: UILabel!
    
    var game = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player2Guesstf.delegate = self
        let dashes = GameModel.getDashes(word: game.player1WordInput)
        wordInPlayLabel.text = dashes.joined(separator: " ")
        alreadyGuessedLabel.text = ""
    }
    
    func hangManStrikes() {
        switch game.numOfGuessesWrong {
        case 0 :
            hangManImage.image = #imageLiteral(resourceName: "hang1")
        case 1 :
            hangManImage.image = #imageLiteral(resourceName: "hang2")
        case 2:
            hangManImage.image = #imageLiteral(resourceName: "hang3")
        case 3:
            hangManImage.image = #imageLiteral(resourceName: "hang4")
        case 4:
            hangManImage.image = #imageLiteral(resourceName: "hang5")
        case 5:
            hangManImage.image = #imageLiteral(resourceName: "hang6")
        case 6:
            hangManImage.image = #imageLiteral(resourceName: "hang7")
        default:
            hangManImage.image = #imageLiteral(resourceName: "hang1")
        }
        
    }

}

extension Player2ScreenViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var usedLetter : Set<String> = []
        
        if usedLetter.contains(string) {
            alreadyGuessedLabel.text = "You already guessed that!"
        }
        
        if game.player1WordInput.contains(Character(string)) {
            usedLetter.insert(string)
            for (index, char) in game.player1WordInput.enumerated() {
                if char == Character(string) {
                    game.indicies.insert(index)
                }
            }
            
        }
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        player2Guesstf.resignFirstResponder()
        return true
    }
    
}
