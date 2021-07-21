//
//  CarList.swift
//  CarFax
//
//  Created by Mark bergeson on 7/14/21.
//

import Foundation

struct AllCars: Codable {
    var listings: [CarList]
}

struct CarList: Codable {
    let year: Int
    let make: String
    let model: String
    let listPrice: Double
    let mileage: Int
    let images: Images
    let dealer: Dealer
    
    
}

struct Images: Codable {
    let firstPhoto: FirstPhoto
}

struct FirstPhoto: Codable {
    let medium: URL?
    let small: URL?
}

struct Dealer: Codable {
    let city: String?
    let state: String?
    let phone: String?
}
