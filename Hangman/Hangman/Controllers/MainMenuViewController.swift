//
//  MainMenuViewController.swift
//  Hangman
//
//  Created by Leandro Wauters on 11/23/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
   
    @IBOutlet weak var numberOfPlayersLabel: UILabel!
    @IBOutlet var numberOfPlayer: [UIButton]!
    @IBOutlet var chooseColor: [UILabel]!
    @IBOutlet var singlePlayerColor: [UIButton]!
    @IBOutlet var twoPlayersColor: [UIButton]!
    @IBOutlet weak var selectChalk: UILabel!
    @IBOutlet weak var fontPickerView: UIPickerView!
    @IBOutlet weak var chooseImage: UILabel!
    @IBOutlet var singlePlayerImages: [UIButton]!
    @IBOutlet var twoPlayersImages: [UIButton]!

    override func viewDidLoad() {
  
        super.viewDidLoad()

        fontPickerView.dataSource = self
        fontPickerView.delegate = self
        HangmanBrain.arrayOfImages = [String]()
        restartUI()
        print("view load")
        print(Categories.categoryArray)
    }
    override func viewDidDisappear(_ animated: Bool) {
        restartUI()
    }
    private func restartUI (){
//        numberOfPlayer.forEach{$0.isHidden = true}
        selectChalk.isHidden = true
        numberOfPlayer.forEach{$0.isEnabled = true}
        singlePlayerColor.forEach{$0.isEnabled = true}
        twoPlayersColor.forEach{$0.isEnabled = true}
        singlePlayerImages.forEach{$0.isHidden = true}
        twoPlayersImages.forEach{$0.isHidden = true}
        chooseImage.isHidden = true
        chooseColor.forEach{$0.isHidden = true}
        fontPickerView.isHidden = true
        singlePlayerColor.forEach{$0.isHidden = true} // need
        twoPlayersColor.forEach{$0.isHidden = true}
        numberOfPlayersLabel.text = "Select Number Of Players"
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

    @IBAction func playerSelected(_ sender: UIButton) {
        switch sender.tag {
        case 0: // single player
            numberOfPlayer.forEach{$0.isEnabled = !$0.isEnabled}
            sender.isEnabled = true
            numberOfPlayer.forEach{$0.setTitleColor(UIColor.gray, for: .disabled)}
            chooseColor.forEach{$0.isHidden = !$0.isHidden}
            singlePlayerColor.forEach{$0.isHidden = !$0.isHidden}
            numberOfPlayersLabel.text = "Single Player"
            sender.isUserInteractionEnabled = false
        case 1:
            numberOfPlayer.forEach{$0.isEnabled = !$0.isEnabled}
            sender.isEnabled = true
            numberOfPlayer.forEach{$0.setTitleColor(UIColor.gray, for: .disabled)}
            chooseColor.forEach{$0.isHidden = !$0.isHidden}
            twoPlayersColor.forEach{$0.isHidden = !$0.isHidden}
            numberOfPlayersLabel.text = "Two Players"
            sender.isUserInteractionEnabled = false
        default:
            print("Error")
        }
    }
    
    @IBAction func colorSelected(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            singlePlayerColor.forEach{$0.isEnabled = !$0.isEnabled}
            sender.isEnabled = true
            HangmanBrain.colorWasSelected(colorChosen: HangmanBrain.backgroundColor[0], toBeShown: singlePlayerImages, showPickerLabel: selectChalk, showPicker: fontPickerView, labelShown: chooseImage, buttons: singlePlayerColor )
            sender.isUserInteractionEnabled = false
            
        case 1:
            twoPlayersColor.forEach{$0.isEnabled = !$0.isEnabled}
            sender.isEnabled = true
            HangmanBrain.colorWasSelected(colorChosen: HangmanBrain.backgroundColor[0], toBeShown: twoPlayersImages, showPickerLabel: selectChalk, showPicker: fontPickerView, labelShown: chooseImage, buttons: twoPlayersColor)
            sender.isUserInteractionEnabled = false
            
        case 2:
            singlePlayerColor.forEach{$0.isEnabled = !$0.isEnabled}
            sender.isEnabled = true
            HangmanBrain.colorWasSelected(colorChosen: HangmanBrain.backgroundColor[1], toBeShown: singlePlayerImages, showPickerLabel: selectChalk, showPicker: fontPickerView, labelShown: chooseImage, buttons: singlePlayerColor)
            sender.isUserInteractionEnabled = false
        case 3:
            twoPlayersColor.forEach{$0.isEnabled = !$0.isEnabled}
            sender.isEnabled = true
            HangmanBrain.colorWasSelected(colorChosen: HangmanBrain.backgroundColor[1], toBeShown: twoPlayersImages, showPickerLabel: selectChalk, showPicker: fontPickerView, labelShown: chooseImage, buttons: twoPlayersColor)
            sender.isUserInteractionEnabled = false
        default:
            print("Wrong Button")
            
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
        pickerView.backgroundColor = HangmanBrain.fontColor[row]
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HangmanBrain.fontColorNames[row]
    }
}
