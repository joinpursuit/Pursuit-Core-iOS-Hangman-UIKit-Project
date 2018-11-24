//
//  MainMenuViewController.swift
//  Hangman
//
//  Created by Leandro Wauters on 11/23/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HangmanBrain.arrayOfImages = [String]()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "drawing":
//            guard let destination = segue.destination as? ViewController else {return}
            HangmanBrain.arrayOfImages = ["Default Image", "hang1","hang2","hang3","hang4","hang5","hang6","hang7"]
        case "cartoon":
            HangmanBrain.arrayOfImages = ["Default Image", "hang1b","hang2b","hang3b","hang4b","hang5b","hang6b","hang7b"]
        default:
            print("No segue")
        }
    }


}
