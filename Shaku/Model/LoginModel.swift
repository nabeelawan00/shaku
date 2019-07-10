//
//  LoginModel.swift
//  Shaku
//
//  Created by qazi ammar arshad on 7/6/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import Foundation
import SwiftyJSON

// this model can also use as signModle.
class LoginModel {
    
    let status: String!
    let message: String!
    let userid: String!
    let name: String!
    let email: String!
    let mobileno: String!
    
    init(response: Any) {
        let jsonResponse = JSON(response)
//       let jsonResponse = response as! JSON
        status = jsonResponse["status"].stringValue
        message = jsonResponse["message"].stringValue
        userid = jsonResponse["userid"].stringValue
        name = jsonResponse["name"].stringValue
        email = jsonResponse["email"].stringValue
        mobileno = jsonResponse["mobileno"].stringValue
    }
}
