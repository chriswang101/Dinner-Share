//
//  AddMealTableViewController.swift
//  dinner-share
//
//  Created by Chris Wang on 2/3/18.
//  Copyright © 2018 Chris Wang. All rights reserved.
//

import UIKit

class AddMealTableViewController: UITableViewController {

    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var totalCostTextField: UITextField!
    
    @IBOutlet weak var peopleCounterPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let peoplePickerNumbers = ["1","2","3","4","5","6","7","8","9"]
    
    var button: UIButton! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleCounterPicker.delegate = self
        
        // Initialize button and add to bottom of tableView
        button = UIButton(frame: CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50))
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        self.navigationController?.view.addSubview(button)
        
        mealNameTextField.setBottomBorder()
        totalCostTextField.setBottomBorder()
        
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false
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

extension AddMealTableViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}

extension AddMealTableViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return peoplePickerNumbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return peoplePickerNumbers[row]
    }
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
