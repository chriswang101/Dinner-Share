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
    
    var meal: Meal?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var directionsButton: UIButton!
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = "MMMM dd, yyyy, h:mm a"
        
        imageView.image = UIImage(named: meal!.imageName)
        titleLabel.text = meal!.description
        dateLabel.text = formatter.string(from: meal!.date)
        addressLabel.text = "123 Cody Ave Apt 42A\n San Luis Obispo, CA 97261"
        
        mapView.showsUserLocation = true
        
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
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
