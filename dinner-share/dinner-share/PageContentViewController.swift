//
//  PageContentViewController.swift
//  Xplore
//
//  Created by Chris Wang on 02/.
//  Copyright © 2017 Chris Wang. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    let formatter = DateFormatter()
    
    var meal: Meal?
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    weak var delegate: DetailDelegate?
    
    var pageIndex: Int?
    
    @IBAction func imageTap(_ sender: Any) {
        print("Tapped")
        guard let meal_ = meal else {
            print("returned from imageztPA")
            return
            
        }
        print("not returned")
        delegate?.wasTapped(meal: meal_)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "MM-dd-yy HH:mm"
        
        guard let meal_ = meal else { return }
        imageView.image = UIImage(named: meal_.imageName)
        descriptionLabel.text = meal_.description
        dateLabel.text = formatter.string(from: meal_.date)
        distanceLabel.text = "\(String(describing: meal?.distance))"
    }
    

}


