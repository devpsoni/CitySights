//
//  Business.swift
//  CitySights App
//
//  Created by Dev Soni on 29/07/25.
//

import Foundation

struct Business: Decodable, Identifiable {
    var id : String?
    var name : String?
    var alias: String?
    var categories: [Category]
    var coordinates: Coordinate?
    var displayPhone: String?
    var distance: Double?
    var imageUrl: String?
    var isClosed: Bool?
    var location: Location?
    var phone: String?
    var rating: Double?
    var reviewCount: Int?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case displayPhone = "display_phone"
        case isClosed = "is_closed"
        case imageUrl = "image_url"
        case reviewCount = "review_count"
        
        case id
        case name
        case alias
        case categories
        case coordinates
        case distance
        case location
        case phone
        case rating
        case url
    }
}

struct Category: Decodable {
    var alias: String?
    var title: String?
}

struct Location: Decodable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var country: String?
    var displayAddress: [String]?
    var state: String?
    var zipCode: String?
    
    enum CodingKeys: String, CodingKey {
        case address1
        case address2
        case address3
        case city
        case country
        case displayAddress = "display_address"
        case state
        case zipCode = "zip_code"
    }
}
