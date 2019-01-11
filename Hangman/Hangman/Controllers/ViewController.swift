

import UIKit

class ViewController: UIViewController {
    var dataFromBrain : Brain!
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var letterTextField: UITextField!
    @IBOutlet weak var blankSpaces: UILabel!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var winOrLossTrack: UILabel!
    @IBOutlet weak var wrongGuesses: UILabel!
    
    
    var strikeNum = 0 {
        didSet{
            if strikeNum > 5 {
                blankSpaces.text = "\(String(describing: wordTextField))"
                wordTextField.isEnabled = false
                letterTextField.isEnabled = false
                winOrLossTrack.text = "You hang"
            }
        }
    }
    
    var playerWin = false {
        didSet {
            if playerWin {
                winOrLossTrack.text = "You Live Another Day"
                wordTextField.isHidden = true
                letterTextField.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordTextField.delegate = self
        letterTextField.delegate = self
        dataFromBrain = Brain(hiddenWord: [], strikes: 0, guesses: [], word: "hi", playerLoss: false)
        letterTextField.isHidden = true
        winOrLossTrack.text = " "
        wrongGuesses.text = " "
        
        
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        dataFromBrain = Brain(hiddenWord: [], strikes: 0, guesses: [], word: "hi", playerLoss: false)
        resetBrainPropertiesValues()
        
        
    }
    
    func resetBrainPropertiesValues (){
        
        wordTextField.isHidden = false
        letterTextField.isHidden = true
        blankSpaces.text = ""
        winOrLossTrack.text = ""
        wrongGuesses.text = ""
        strikeNum = 0
        
    }
    func getHangmanPics(_ strike : Int) -> UIImage? {
        return UIImage.init(named: "hang\(strike)")
        
    }
}

extension ViewController : UITextFieldDelegate{
    
    private func extractedFunc() {
        letterTextField.isHidden = false
        letterTextField.text = ""
        wordTextField.text = ""
        wordTextField.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        resignFirstResponder()
        
        if textField == wordTextField {
            
            let word = textField.text?.uppercased() ?? ""
            dataFromBrain.setHiddenWord(word: word)
            dataFromBrain.setWord(word: word)
        }
        
        blankSpaces.text = dataFromBrain.getHiddenWord()
        
        if textField == letterTextField {
            
            if let unwrappedLetter = textField.text?.uppercased() {
                dataFromBrain.updateHiddenWord(letter: unwrappedLetter)
                dataFromBrain.updateStrikes(guessLetter: unwrappedLetter)
                if !dataFromBrain.isLetterInTheWord(letter: unwrappedLetter) {
                    winOrLossTrack.text = "\(unwrappedLetter) is Strike\(strikeNum)"
                    imageDisplay.image = getHangmanPics(dataFromBrain.getStrikes())
                    strikeNum = dataFromBrain.getStrikes()
                }
                blankSpaces.text = dataFromBrain.getHiddenWord()
            }
            letterTextField.isHidden = false
            letterTextField.text = ""
            
        }
        
        if dataFromBrain.getHiddenWord().replacingOccurrences(of: " ", with: "") == dataFromBrain.getWord() {
            
            winOrLossTrack.text = "YOU WIN!!🍻!🤟🏽"
        }
        extractedFunc()
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var letter = ""
        if textField == letterTextField {
            
            
            let alphabet = Brain.alphabets
            let userEnteredletterField = letterTextField.text ?? ""
            guard let stringRange = Range(range, in: userEnteredletterField) else {return false}
            guard userEnteredletterField.count < 1 else {return false}
            guard !dataFromBrain.guesses.contains(string.uppercased()) else { return false }
            
            for i in alphabet {
                if userEnteredletterField == i {
                    letter = userEnteredletterField.replacingCharacters(in: stringRange , with: string)
                }
            }
            
        }
        return true
    }
}
