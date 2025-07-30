//
//  RatingHelper.swift
//  CitySights App
//
//  Created by Dev Soni on 30/07/25.
//

import Foundation

struct RatingHelper {
    static func assetName(for rating: Double?) -> String {
        if let rating = rating {
            let roundedRating = (rating * 2).rounded() / 2.0 // Round to the nearest 0.5
            return "regular_\(String(roundedRating))"
        } else {
            return "regular_0.0"
        }
    }
}
