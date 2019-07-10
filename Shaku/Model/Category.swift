//
//  Category.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 16, 2019

import Foundation

struct RootCategory : Codable {
    
    let categories : [Category]?
    let message : String?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
        case message = "message"
        case status = "status"
    }
    
}
struct Category : Codable {

    let descriptionField : String?
    let id : String?
    let name : String?
    let user : String?
    
    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case id = "id"
        case name = "name"
        case user = "user"
    }
    
}
