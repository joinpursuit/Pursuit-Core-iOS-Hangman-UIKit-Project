//
//  SinglePlayerViewController.swift
//  Hangman
//
//  Created by Leandro Wauters on 11/22/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class SinglePlayerViewController: UIViewController {

    var randomWord = HangmanBrain.allTheWords.randomElement()
    @IBOutlet weak var randowWord: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var wrong: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randowWord.text = HangmanBrain.transformWord(word: randomWord!)
        print(randomWord!)
    }


}

