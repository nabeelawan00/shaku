//
//  CouponsHome.swift
//  Shaku
//
//  Created by Mudassar on 16/02/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import Foundation

struct RootClass : Codable {
    
    let coupons : [CouponHome]?
    let message : String?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case coupons = "coupons"
        case message = "message"
        case status = "status"
    }
    
}
struct CouponHome : Codable {
    
    let availableOnline : String?
    let category : String?
    let clicks : String?
    let code : String?
    let descriptionField : String?
    let exclusive : String?
    let expiration : String?
    let id : String?
    let image : String?
    let paidUntil : String?
    let popular : String?
    let start : String?
    let store : String?
    let title : String?
    let user : String?
    let views : String?
    let visible : String?
    
    enum CodingKeys: String, CodingKey {
        case availableOnline = "available_online"
        case category = "category"
        case clicks = "clicks"
        case code = "code"
        case descriptionField = "description"
        case exclusive = "exclusive"
        case expiration = "expiration"
        case id = "id"
        case image = "image"
        case paidUntil = "paid_until"
        case popular = "popular"
        case start = "start"
        case store = "store"
        case title = "title"
        case user = "user"
        case views = "views"
        case visible = "visible"
    }
    
}
