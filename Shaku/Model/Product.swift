//
//  Product.swift
//  Shaku
//
//  Created by Bills Mac on 18/12/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import Foundation

struct Product_Api : Codable {
    let status : String?
    let message : String?
    let products : [Product]?
}


struct Product : Codable {
    let id : String?
    let user : String?
    let store : String?
    let categoryID : String?
    let categoryname : String?
    let popular : String?
    let title : String?
    let link : String?
    let image : String?
    let description : String?
    let price : String?
    let old_price : String?
    let currency : String?
    let start : String?
    let expiration : String?

}
