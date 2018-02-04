//
//  AddUserViewController.swift
//  dinner-share
//
//  Created by Victor Bodell on 2/3/18.
//  Copyright © 2018 Chris Wang. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    struct SegueIDs {
        static let saveSegue = "SaveProfileSegue"
    }
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSaveButtonState()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField === addressTextField {
            textField.resignFirstResponder()
            
            //Update save button if we have valid text
            updateSaveButtonState()
            return true
        }
        textField.resignFirstResponder()
        addressTextField.becomeFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Update save button if we have valid text
        updateSaveButtonState()
    }
    
    // MARK: ImageView
    
    
    @IBAction func choosePhotoFromLibrary(_ sender: UITapGestureRecognizer) {
        NSLog("Entered imagestuff")
        
        //Make sure textfield keyboards are dismissed properly if selected
        nameTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Use the photolibrary, not camera
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        profileImage.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        NSLog("Entered fields: \(String(describing: nameTextField.text)), \(String(describing: addressTextField.text))")
        
        if segue.identifier == SegueIDs.saveSegue {
            
            
            //let destVC = segue.destination as! ShowProfileViewController
            //destVC.profile = User(name: nameTextField.text!, address: addressTextField.text!, image: profileImage.image!)
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    private func updateSaveButtonState() {
        let text1 = nameTextField.text ?? ""
        let text2 = addressTextField.text ?? ""
        saveButton.isEnabled = !text1.isEmpty && !text2.isEmpty
    }
 

}
