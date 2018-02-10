//
//  HomeTableViewController.swift
//  
//
//  Created by Chris Wang on 2/3/18.
//

import UIKit

protocol DetailDelegate: class {
    func wasTapped(meal: Meal)
}

extension HomeTableViewController: DetailDelegate {
    func wasTapped(meal: Meal) {
        print("WasTappedc alled" )
        tappedMeal = meal
        
        self.performSegue(withIdentifier: "showDetailSegue", sender: self)
    }
}

class HomeTableViewController: UITableViewController {

    @IBOutlet weak var recommendationsScrollView: UIScrollView!
    @IBOutlet weak var nearYouScrollView: UIScrollView!
    @IBOutlet weak var topRatedScrollView: UIScrollView!
    
    lazy var recommendationVCs = [UIViewController]()
    lazy var nearYouVCs = [UIViewController]()
    lazy var topRatedVCs = [UIViewController]()
    
    let formatter = DateFormatter()
    
    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    var tappedMeal: Meal?
    
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
    
    func createPageVCs(meals: [Meal]) -> [UIViewController] {
        var VCs = [UIViewController]()
        for meal in meals {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pageContentViewController") as! PageContentViewController
            vc.delegate = self
            
            vc.loadView()
            vc.meal = meal
            vc.imageView.image = UIImage(named: meal.imageName)
            vc.descriptionLabel.text = meal.description
            vc.dateLabel.text = formatter.string(from: meal.date)
            vc.distanceLabel.text = String(format: "%.2f", meal.distance)
            
            VCs.append(vc)
        }
        return VCs
    }
    
    func populate(scrollView: UIScrollView, with VCs: [UIViewController]) {
        var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0 ..< VCs.count {
            frame.origin.x = CGFloat(index) * scrollView.frame.size.width
            frame.size = CGSize(width: scrollView.frame.size.width * 0.97, height: scrollView.frame.size.height)
            scrollView.isPagingEnabled = true
            
            let contentView: UIView! = VCs[index].view
            contentView.frame = frame
            contentView.center = CGPoint(x: CGFloat(index) * scrollView.frame.size.width + scrollView.frame.size.width * CGFloat(0.5), y: scrollView.frame.size.height / 2)
            
            scrollView.addSubview(contentView)
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(VCs.count), height: scrollView.frame.size.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure date formatter
        formatter.dateFormat = "MM-dd-yy HH:mm"
        
        // Configure tableView appearance
        self.tableView.separatorStyle = .none

        recommendationsScrollView.delegate = self
        recommendationsScrollView.clipsToBounds = false
        
        nearYouScrollView.delegate = self
        nearYouScrollView.clipsToBounds = false
        
        topRatedScrollView.delegate = self
        topRatedScrollView.clipsToBounds = false
        
        // Do VC filling
        recommendationVCs = createPageVCs(meals: recommendationMeals)
        nearYouVCs = createPageVCs(meals: nearYouMeals)
        topRatedVCs = createPageVCs(meals: topRatedMeals)
        populate(scrollView: recommendationsScrollView, with: recommendationVCs)
        populate(scrollView: nearYouScrollView, with: nearYouVCs)
        populate(scrollView: topRatedScrollView, with: topRatedVCs)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetailSegue") {
            guard let detailTableViewController = segue.destination as? DetailTableViewController else {
                print("retuened")
                return
            }
            
            // Configure detailTableViewController
            detailTableViewController.meal = tappedMeal
        }
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
