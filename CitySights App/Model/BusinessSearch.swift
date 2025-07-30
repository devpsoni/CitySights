//
//  BusinessSearch.swift
//  CitySights App
//
//  Created by Dev Soni on 29/07/25.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses = [Business]()
    var region = Region()
    var total: Int = 0
}


struct Region: Decodable {
    var center: Coordinate?
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}
