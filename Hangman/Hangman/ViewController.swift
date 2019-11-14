//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var securedWordTF: UITextField!
    @IBOutlet weak var hiddenSecuredWordLabel: UILabel!
    @IBOutlet weak var userFeedBackLabel: UILabel!
    @IBOutlet weak var guessWordTF: UITextField!
    
    lazy var securedWord = securedWordTF.text!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    securedWordTF.delegate = self
    hiddenSecuredWordLabel.isHidden = true
  }

    @IBAction func newGameButton(_ sender: UIButton) {
    }
    
    //helper func
    func returnHiddenWordToLabel(){
        hiddenSecuredWordLabel.text = String(repeating: "_ ", count: securedWord.count)
    }
    
}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        returnHiddenWordToLabel()
        hiddenSecuredWordLabel.isHidden = false
        return true
    }
}

