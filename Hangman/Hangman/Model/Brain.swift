//
//  HangmanModel.swift
//  Hangman
//
//  Created by katty y marte on 12/18/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

struct Brain {
    static func getHangmanPics() -> [UIImage] {
        return [
            UIImage.init(named: "hang1")!,
            UIImage.init(named: "hang2")!,
            UIImage.init(named: "hang3")!,
            UIImage.init(named: "hang4")!,
            UIImage.init(named: "hang5")!,
            UIImage.init(named: "hang6")!,
            UIImage.init(named: "hang7")!,
        ]
    }
    
    static let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
}

