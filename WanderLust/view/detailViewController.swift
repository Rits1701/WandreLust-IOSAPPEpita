//
//  detailViewController.swift
//  WanderLust
//
//  Created by Ritu Shikha on 29/03/2018.
//  Copyright © 2018 epita. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    var place : Places?
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var txtDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      lblTitle.text = (place?.placeTitle)!
        lblCategory.text = "Country: " + (place?.country)!
        txtDescription.text = (place?.description)!
       
        let image = UIImage(named: (place?.imageName)!)
        mealImage.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
