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
    @IBOutlet var chooseColor: [UILabel]!
    
    @IBOutlet weak var fontPickerView: UIPickerView!
    @IBOutlet var singlePlayerColor: [UIButton]!
    
    @IBOutlet var twoPlayersColor: [UIButton]!
   
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
  
        super.viewDidLoad()

        fontPickerView.dataSource = self
        fontPickerView.delegate = self
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
    @IBAction func colorSelected(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            HangmanBrain.chosenBackgroundColor = HangmanBrain.backgroundColor[0]
            chooseImage.isHidden = !chooseImage.isHidden
            singlePlayerImages.forEach{$0.isHidden = !$0.isHidden}
            
        case 1:
            HangmanBrain.chosenBackgroundColor = HangmanBrain.backgroundColor[0]
            chooseImage.isHidden = !chooseImage.isHidden
            twoPlayersImages.forEach{$0.isHidden = !$0.isHidden}
        case 2:
            HangmanBrain.chosenBackgroundColor = HangmanBrain.backgroundColor[1]
            chooseImage.isHidden = !chooseImage.isHidden
            singlePlayerImages.forEach{$0.isHidden = !$0.isHidden}
        case 3:
             HangmanBrain.chosenBackgroundColor = HangmanBrain.backgroundColor[1]
             chooseImage.isHidden = !chooseImage.isHidden
             twoPlayersImages.forEach{$0.isHidden = !$0.isHidden}
        default:
            print("Wrong Button")
            
        }
        
        
        
    }
    @IBAction func playerSelected(_ sender: UIButton) {
        switch sender.tag {
        case 0: // single player
            numberOfPlayer.forEach{$0.isHidden = true}
            chooseColor.forEach{$0.isHidden = !$0.isHidden}
            singlePlayerColor.forEach{$0.isHidden = !$0.isHidden}
            fontPickerView.isHidden = !fontPickerView.isHidden
            sender.isHidden = false
        case 1:
            numberOfPlayer.forEach{$0.isHidden = true}
            chooseColor.forEach{$0.isHidden = !$0.isHidden}
            twoPlayersColor.forEach{$0.isHidden = !$0.isHidden}
            fontPickerView.isHidden = !fontPickerView.isHidden
            sender.isHidden = false
        default:
            print("Error")
        }
    }
    

}


extension MainMenuViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return HangmanBrain.fontColor.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        HangmanBrain.chosenFontColor = HangmanBrain.fontColor[row]
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HangmanBrain.fontColorNames[row]
    }
}
