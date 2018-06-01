//
//  places.swift
//  WanderLust
//
//  Created by Ritu Shikha on 29/03/2018.
//  Copyright © 2018 epita. All rights reserved.
//

import Foundation

class Places {
    
    var placeTitle : String?
    var country : String?
    var description : String?
    var imageName : String?
    
    init(placeTitle:String, country:String, description:String, imageName:String) {
        self.placeTitle = placeTitle
        self.country = country
        self.description = description
        self.imageName = imageName
    }
}
