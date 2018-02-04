//
//  DetailTableViewController.swift
//  dinner-share
//
//  Created by Chris Wang on 2/4/18.
//  Copyright © 2018 Chris Wang. All rights reserved.
//

import UIKit
import MapKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var directionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        
        // Configure directions button
        directionsButton.layer.shadowColor = UIColor.black.cgColor
        directionsButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        directionsButton.layer.masksToBounds = false
        directionsButton.layer.shadowRadius = 1.0
        directionsButton.layer.shadowOpacity = 0.5
        directionsButton.layer.cornerRadius = directionsButton.frame.width / 2

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
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
