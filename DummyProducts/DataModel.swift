//
//  DataModel.swift
//  BuildAnAppDayTemplate
//
//  Created by Nipun Singh on 10/11/21.
//

//https://app.quicktype.io/ can make this process easier, especially for larger JSON's.
//Make sure to add Codable to each struct you create.
//Rename this file to match the name of your struct.

import Foundation

struct DataModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let welcomeDescription: String
    let category: Category
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case welcomeDescription = "description"
        case category, image, rating
    }
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}

//typealias Data = [DataModel]
