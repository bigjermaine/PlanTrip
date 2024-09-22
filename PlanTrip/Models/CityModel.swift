//
//  CityModel.swift
//  PlanTrip
//
//  Created by MacBook AIR on 19/09/2024.
//

import Foundation

struct City: Identifiable {
    let id = UUID()
    let name: String
    let region: String
    let country: String
    let countryCode: String
}

struct Citys: Codable,Identifiable{
    var id = UUID()
    let name: String
    let region: String
    let country: String
    let countryCode: String
    let imageAsset: String
    let famousCity: String
}
