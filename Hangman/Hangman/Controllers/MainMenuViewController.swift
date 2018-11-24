//
//  MainMenuViewController.swift
//  Hangman
//
//  Created by Leandro Wauters on 11/23/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    @IBOutlet var numberOfPlayer: [UIButton]!
    @IBOutlet var singlePlayerImages: [UIButton]!
    @IBOutlet var twoPlayersImages: [UIButton]!
    @IBOutlet weak var chooseImage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HangmanBrain.arrayOfImages = [String]()
        restartUI()
        print("view load")
    }
    override func viewDidDisappear(_ animated: Bool) {
        restartUI()
    }
    private func restartUI (){
        numberOfPlayer.forEach{$0.isHidden = true}
        singlePlayerImages.forEach{$0.isHidden = true}
        twoPlayersImages.forEach{$0.isHidden = true}
        chooseImage.isHidden = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "drawing":

            HangmanBrain.arrayOfImages = ["Default Image", "hang1","hang2","hang3","hang4","hang5","hang6","hang7"]
        case "cartoon":
            HangmanBrain.arrayOfImages = ["Default Image", "hang1b","hang2b","hang3b","hang4b","hang5b","hang6b","hang7b"]
        default:
            print("No segue")
        }
    }
    @IBAction func chooseNumberOfPlayers(_ sender: UIButton) {
        
        
        numberOfPlayer.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
    }
    @IBAction func playerSelected(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            numberOfPlayer.forEach{$0.isHidden = true}
            singlePlayerImages.forEach{$0.isHidden = !$0.isHidden}
            chooseImage.isHidden = !chooseImage.isHidden
            sender.isHidden = false
        case 1:
            numberOfPlayer.forEach{$0.isHidden = true}
            twoPlayersImages.forEach{$0.isHidden = !$0.isHidden}
            chooseImage.isHidden = !chooseImage.isHidden
            sender.isHidden = false
        default:
            print("Error")
        }
    }
    

}
