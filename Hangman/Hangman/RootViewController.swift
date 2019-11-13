//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    // When orientation is landscape, the twoPlayerButton is unpressable. Fix this at some point.
    //MARK: Properties and Outlets
    @IBOutlet weak var twoPlayerGameButton: UIButton!
    @IBOutlet weak var singlePlayerGameButton: UIButton!
    
    //MARK: Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    twoPlayerGameButton.setTitle("Two Player Game", for: .normal)
    singlePlayerGameButton.setTitle("Single Player Game", for: .normal)
  }
    
    //MARK: Other methods of RootViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "TwoPlayerGame"{
            let referenceToViewController: GameViewController = segue.destination as! GameViewController
            referenceToViewController.setOneOrTwoPlayers(true)
        }
    }

}

