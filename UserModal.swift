//
//  UserModal.swift
//  Janki-Demo
//
//  Created by admin on 6/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
struct UserProfileModal {
    var languages : String
    var user_email : String
    var user_contact : String
    var user_type : String
    var user_name : String
    var user_location : String
    var user_image : String
    var user_desc : String
    var user_rating : String
    var latitude : String
    var longitude : String

    var arrPortfolio = [UserportfolioModal]()
    
    init(languages : String, user_email: String, user_contact: String, user_type: String, user_name: String, user_location: String, user_image: String, user_desc: String, user_rating: String,latitude : String,longitude : String,arrPortfolio : [UserportfolioModal]) {
        self.languages = languages
        self.user_email = user_email
        self.user_contact = user_contact
        self.user_type = user_type
        self.user_name = user_name
        self.user_location = user_location
        self.user_image = user_image
        self.user_desc = user_desc
        self.user_rating = user_rating
        self.latitude = latitude
        self.longitude = longitude

        self.arrPortfolio = arrPortfolio

    }
}

struct UserportfolioModal {
    var portfolio_id : String
    var portfolio_image : String
  
    
    
    init(portfolio_id : String, portfolio_image: String) {
        self.portfolio_id = portfolio_id
        self.portfolio_image = portfolio_image
     
        
    }
}
