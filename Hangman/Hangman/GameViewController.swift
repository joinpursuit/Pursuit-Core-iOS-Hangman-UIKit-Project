//
//  GameViewController.swift
//  Hangman
//
//  Created by Brendon Cecilio on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK:- Outlets and Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDisplay: UILabel!
    @IBOutlet weak var wordDisplay: UILabel!
    
    var gameWord = Word()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // calls function from brain - gets word in "_" form
        let hiddenWord = Word.getDashes(word: gameWord.word)
        // displays word in wordDisplay and seperates dashes with " "
        wordDisplay.text = hiddenWord.joined(separator: " ")
    }
    
    // MARK:- Methods and Actions
    
//    func gameStatus() {
//
//        if gameWord.guessWord.contains(gameWord.word) {
//            for (index, char) in gameWord.word.enumerated(){
//
//            }
//        }
//
//    }

}
