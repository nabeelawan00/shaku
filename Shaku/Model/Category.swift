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
    let subcategories: [Subcategories]?
    
    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case id = "id"
        case name = "name"
        case user = "user"
        case subcategories = "subcategories"
    }
    
}

struct Subcategories: Codable {
    let id: String?
    let user: String?
    let name: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case user = "user"
        case name = "name"
        case description = "description"
    }
}
