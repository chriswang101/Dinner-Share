//
//  PageContentViewController.swift
//  Xplore
//
//  Created by Chris Wang on 11/18/17.
//  Copyright © 2017 Chris Wang. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //weak var delegate: DetailDelegate?
    
    var pageIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    @IBAction func imageTap(_ sender: Any) {
//        delegate?.wasTapped(locationName: titleLabel.text, locationAddress: descriptionLabel.text, locationImage: imageView.image, locationLocation: location)
//    }
}


