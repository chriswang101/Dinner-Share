//
//  General.swift
//  dinner-share
//
//  Created by Chris Wang on 2/4/18.
//  Copyright © 2018 Chris Wang. All rights reserved.
//

import UIKit

let themeColorBlue = UIColor(red: 115/255, green: 210/255, blue: 255/255, alpha: 1.0)

let themeColorRed = UIColor(red: 255/255, green: 100/255, blue: 100/133, alpha: 1.0)

let themeColorPurple = UIColor(red: 183/255, green: 126/255, blue: 237/255, alpha: 1.0)


extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = themeColorRed.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

struct Meal {
    let imageName: String
    let date: Date
    let description: String
    let distance: Float
}


