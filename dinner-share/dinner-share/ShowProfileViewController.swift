//
//  ShowProfileViewController.swift
//  dinner-share
//
//  Created by Victor Bodell on 2/3/18.
//  Copyright © 2018 Chris Wang. All rights reserved.
//

import UIKit

class ShowProfileViewController: UIViewController {

    // MARK: Properties
    
    var profile: User?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let newUser = profile else {
            fatalError("No user to display!")
        }
        
        navigationItem.title = newUser.name
        
        nameLabel.text = newUser.name
        addressLabel.text = newUser.address
        
        if let image = newUser.image {
            profileImage.image = image
        }
        else {
            profileImage.image = #imageLiteral(resourceName: "person-placeholder.jpg")
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
