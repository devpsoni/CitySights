//
//  Texthelper.swift
//  CitySights App
//
//  Created by Dev Soni on 30/07/25.
//

import Foundation

struct Texthelper {
    static func distanceAwayText(meters: Double) -> String { // STATIC FUNC so you dont have to use the TextHelper() and then call the function. You can call it directly.
        
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        }
        else {
            return "\(Int(round(meters))) m away"
        }
    }
}
