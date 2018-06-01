//
//  addViewController.swift
//  WanderLust
//
//  Created by Ritu Shikha on 01/06/2018.
//  Copyright © 2018 epita. All rights reserved.
//

import UIKit
import os.log

class addViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var places: Places?
  
    @IBOutlet weak var descriptionTextArea: UITextView!
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var addImageView: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        
        self.placeTextField.layer.borderColor = UIColor(red: 255/255, green: 100/255, blue: 255/255, alpha: 1).cgColor;
        self.placeTextField.layer.borderWidth = CGFloat(Float(1.0));
        self.placeTextField.layer.cornerRadius = CGFloat(Float(5.0));
        self.descriptionTextArea.layer.borderColor = UIColor(red: 255/255, green: 100/255, blue: 255/255, alpha: 1).cgColor;
        self.descriptionTextArea.layer.borderWidth = CGFloat(Float(1.0));
        self.descriptionTextArea.layer.cornerRadius = CGFloat(Float(5.0));
        self.countryTextField.layer.borderColor = UIColor(red: 255/255, green: 100/255, blue: 255/255, alpha: 1).cgColor;
        self.countryTextField.layer.borderWidth = CGFloat(Float(1.0));
        self.countryTextField.layer.cornerRadius = CGFloat(Float(5.0));
        
  
        // Enable the Save button only if the text field has a valid Meal name.
       

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("Save Button Not Pressed", log: OSLog.default, type: .debug)
            return
        }
        
       let place = placeTextField.text
        let country = countryTextField.text
         let description = descriptionTextArea.text
       //let image = UIImage(named: "image\(arc4random_uniform(3) + 1).png")
        
        places = Places(placeTitle: place!, country: country!,description: description!, imageName: "Giza.jpg")
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        addImageView.image = selectedImage
        self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
        
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
