//
//  HangmanPic.swift
//  Hangman
//
//  Created by Jian Ting Li on 11/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


struct HangmanPic {
    let image: UIImage
    let strikeNum: Int
    
    init(image: UIImage, strikeNum: Int) {
        self.image = image
        self.strikeNum = strikeNum
    }
    
    static func getSet1() -> [HangmanPic] {
        var hangmanPictureSet = [HangmanPic]()
        var picNum = 1
        var strikeNum = 0
        
        for _ in 1...7 {
            hangmanPictureSet.append(HangmanPic.init(image: UIImage.init(named: "hang\(picNum)")!, strikeNum: strikeNum))
            picNum += 1
            strikeNum += 1
        }
        
        return hangmanPictureSet
    }

//    static func set2() -> [hangmanPic] {
//
//    }
}
