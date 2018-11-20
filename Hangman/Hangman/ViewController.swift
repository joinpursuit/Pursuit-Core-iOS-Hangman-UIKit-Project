//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userInputText: UITextField!
    @IBOutlet weak var chosenWord: UILabel!
    @IBOutlet weak var user2InputText: UITextField!
    @IBOutlet weak var Image: UIImageView!
    
    var userWord = String()
  override func viewDidLoad() {
    super.viewDidLoad()
    userInputText.delegate = self
  }


}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        userWord = userInputText.text!
        chosenWord.text = 
        return true
    }
}
