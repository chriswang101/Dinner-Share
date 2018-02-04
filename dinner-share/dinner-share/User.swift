//
//  User.swift
//  dinner-share
//
//  Created by Victor Bodell on 2/3/18.
//  Copyright © 2018 Chris Wang. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var name: String
    var address: String
    var image: UIImage?
    
    
    init(name: String, address: String){
        self.name = name
        self.address = address
    }
    
    init(name: String, address: String, image: UIImage){
        self.name = name
        self.address = address
        self.image = image
    }
}
