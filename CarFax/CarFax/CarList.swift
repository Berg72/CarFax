//
//  CarList.swift
//  CarFax
//
//  Created by Mark bergeson on 7/14/21.
//

import Foundation

struct AllCars: Codable {
    let listings:[AllCars]
}

struct CarList: Codable {
    let year: Int
    let make: String
    let model: String?
    let listprice: Int
    let mileage: Int
    let city: String
    let state : String
    let baseUrl: CarListUrl
    
}

struct CarListUrl: Codable {
    let medium: String
    let small: String
}
