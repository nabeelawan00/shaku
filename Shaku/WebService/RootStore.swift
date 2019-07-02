//
//  RootStore.swift
//  Shaku
//
//  Created by Mudassar on 16/02/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import Foundation

struct RootStore : Codable {
    
    let message : String?
    let status : String?
    let stores : [Store]?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
        case stores = "stores"
    }
    
}

struct Store : Codable {
    
    let categoryID : String?
    let descriptionField : String?
    let id : String?
    let image : String?
    let link : String?
    let locations : [Location]?
    let name : String?
    let phoneno : String?
    let physical : String?
    let user : String?
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryID"
        case descriptionField = "description"
        case id = "id"
        case image = "image"
        case link = "link"
        case locations = "locations"
        case name = "name"
        case phoneno = "phoneno"
        case physical = "physical"
        case user = "user"
    }
    
}
struct Location : Codable {
    
    let address : String?
    let city : String?
    let country : String?
    let id : String?
    let lat : String?
    let lng : String?
    let state : String?
    let zip : String?
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case city = "city"
        case country = "country"
        case id = "id"
        case lat = "lat"
        case lng = "lng"
        case state = "state"
        case zip = "zip"
    }
        
}
