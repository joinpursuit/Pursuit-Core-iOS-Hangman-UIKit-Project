//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class gameMenuViewController: UIViewController {

    @IBOutlet weak var hangmanMainImg: UIImageView!
    
    @IBOutlet weak var player1Button: UIButton!
    @IBOutlet weak var picSetLabel: UILabel!
    @IBOutlet weak var set1Button: UIButton!
    @IBOutlet weak var set2Button: UIButton!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    hangmanMainImg.image = UIImage.init(named: "hang7")
    
    player1Button.isHidden = true
    picSetLabel.isHidden = true
    set1Button.isHidden = true
    set2Button.isHidden = true
  }

    //this is used to change hangman picture sets
    @IBAction func chooseHangmanPictureSet(_ sender: UIButton) {
        //switch on sender.tag for appropriate set
    }
    
}

