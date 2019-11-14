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

        wordInPlayLabel.text = ""
        
        
    }
    

}
