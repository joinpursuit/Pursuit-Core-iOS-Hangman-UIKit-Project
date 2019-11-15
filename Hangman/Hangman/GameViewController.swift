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
    @IBOutlet weak var textField: UITextField!
    
    var storeWord:String?
    var word = Word()
    var arr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        print(storeWord ?? "")
        // calls function from brain - gets word in "_" form
        arr = Word.getDashes(word: storeWord ?? "")
        // displays word in wordDisplay and seperates dashes with " "
        wordDisplay.text = arr.joined(separator: " ")
    }
    
    // MARK:- Methods and Actions
    
    func gameStatus() {

        for (index, char) in (storeWord?.enumerated())! {
            
        }

    }

}


