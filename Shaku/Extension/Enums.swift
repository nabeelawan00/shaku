//
//  Enums.swift
//  Shaku
//
//  Created by qazi ammar arshad on 7/10/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import Foundation

enum UserDefaultsEnum: String {
    // key values of login data.
    case status = "status"
    case message = "message"
    case userid = "userid"
    case name = "name"
    case email = "email"
    case mobileno = "mobileno"
}

enum APIEnum: String {
    case home = "home.php"
    case categories = "categories.php"
    case auth = "auth.php"
    case signup = "signup.php"
    case update = "profile_update.php"
    case product = "products.php"
    case coupons = "coupons.php"
}
