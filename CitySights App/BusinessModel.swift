//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Dev Soni on 05/08/25.
//

import Foundation
import SwiftUI

@Observable
class BusinessModel {
    
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business? = nil
    
    var service = DataService()

    func getBusinesses() {
        Task {
            businesses = await service.businessService()
        }
    }
}
