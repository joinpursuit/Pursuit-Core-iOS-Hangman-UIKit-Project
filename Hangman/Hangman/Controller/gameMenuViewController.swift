//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class gameMenuViewController: UIViewController {

  var gameBrain = HangmanBrain()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    //print(gameBrain.hangmanPics)
  }

    //use segue to pass the brain
    @IBAction func chooseHangmanPictureSet(_ sender: UIButton) {
        //switch on sender.tag for appropriate set
    }
    
}

