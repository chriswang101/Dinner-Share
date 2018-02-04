//
//  HomeTableViewController.swift
//  
//
//  Created by Chris Wang on 2/3/18.
//

import UIKit

class HomeTableViewController: UITableViewController {

    @IBOutlet weak var recommendationsScrollView: UIScrollView!
    @IBOutlet weak var nearYouScrollView: UIScrollView!
    @IBOutlet weak var topRatedScrollView: UIScrollView!
    
    lazy var recommendationVCs = [UIViewController]()
    lazy var nearYouVCs = [UIViewController]()
    lazy var topRatedVCs = [UIViewController]()
    
    let recommendationMeals = [
        Meal(imageName: "bread.jpg", date: Date(timeIntervalSinceNow: 10000), description: "Simple meals and pleasures", distance: 2.11),
        Meal(imageName: "burger.jpg", date: Date(timeIntervalSinceNow: 20000), description: "Healthy American dining", distance: 2.39),
        Meal(imageName: "skewer.jpg", date: Date(timeIntervalSinceNow: 30000), description: "Good meats and skewed meats", distance: 0.42)
    ]
    
    let nearYouMeals = [
        Meal(imageName: "dessert.jpg", date: Date(timeIntervalSinceNow: 40000), description: "Good fruity desserts", distance: 0.1),
        Meal(imageName: "italian.jpg", date: Date(timeIntervalSinceNow: 50000), description: "Homemade italian food fresh to eat", distance: 0.64),
        Meal(imageName: "steak.jpg", date: Date(timeIntervalSinceNow: 60000), description: "GOOD FOOD", distance: 0.23)
    ]
    
    let topRatedMeals = [
        Meal(imageName: "meat.jpg", date: Date(timeIntervalSinceNow: 80000), description: "Healthy meats made by me", distance: 2.64),
        Meal(imageName: "pizza.jpg", date: Date(timeIntervalSinceNow: 90000), description: "PIZZA!", distance: 1.3)
    ]
    
    func populatePageVCs(VCs: [UIViewController], meals: [Meal]) {
        for meal in meals {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as! PageContentViewController
            //vc.delegate = self
            
            vc.loadView()
            
            vc.imageView = UIImage
            vc.descriptionLabel.text =
            
            vc.location = CLLocation(latitude: latitude, longitude: longitude)
            pageViewVCs.append(vc)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure tableView appearance
        self.tableView.separatorStyle = .none

        recommendationsScrollView.delegate = self
        recommendationsScrollView.clipsToBounds = false
        
        nearYouScrollView.delegate = self
        nearYouScrollView.clipsToBounds = false
        
        topRatedScrollView.delegate = self
        topRatedScrollView.clipsToBounds = false
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
        return 6
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }


}
