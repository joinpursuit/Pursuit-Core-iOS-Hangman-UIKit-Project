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
    @IBOutlet weak var gameStatus: UILabel!
    
    var game = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player2Guesstf.delegate = self
        game.hiddenWord = game.getDashes(word: game.player1WordInput)
        wordInPlayLabel.text = game.hiddenWord.joined(separator: " ")
        alreadyGuessedLabel.text = ""
        gameStatus.text = ""
    }
    
    func hangManStrikes(numWrong: Int) -> UIImage? {
        let numWrong = game.numOfGuessesWrong
        var imageDisplayed = hangManImage.image
        switch numWrong {
        case 0 :
            imageDisplayed = #imageLiteral(resourceName: "hang1")
            return imageDisplayed
        case 1 :
            imageDisplayed = #imageLiteral(resourceName: "hang2")
            return imageDisplayed
        case 2:
            imageDisplayed = #imageLiteral(resourceName: "hang3")
            return imageDisplayed
        case 3:
            imageDisplayed = #imageLiteral(resourceName: "hang4")
            return imageDisplayed
        case 4:
            imageDisplayed = #imageLiteral(resourceName: "hang5")
            return imageDisplayed
        case 5:
            imageDisplayed = #imageLiteral(resourceName: "hang6")
            return imageDisplayed
        case 6:
            imageDisplayed = #imageLiteral(resourceName: "hang7")
            return imageDisplayed
        default:
            imageDisplayed = #imageLiteral(resourceName: "hang1")
            return imageDisplayed
        }
        
    }
    func winOrLose() {
        gameStatus.text = game.checkWin(guessed: player2Guesstf.text ?? "", player1: game.player1WordInput)
    }

    
}

extension Player2ScreenViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "" {
            return true
        }
        
        wordInPlayLabel.text = game.generateLetters(guessed: string, player1: game.player1WordInput)
        alreadyGuessedLabel.text = game.checkAlreadyUsed(guessed: string)
        hangManImage.image = hangManStrikes(numWrong: game.numOfGuessesWrong)
        winOrLose()
        
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == player2Guesstf {
        player2Guesstf.resignFirstResponder()
        
        return false
        }
        
        return true
    }
    
}
