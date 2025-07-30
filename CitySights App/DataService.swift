//
//  DataService.swift
//  CitySights App
//
//  Created by Dev Soni on 29/07/25.
//

import Foundation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessService() async -> [Business]{
        // 0. Check If API KEY exists
        guard apiKey != nil else {
            return [Business]()
        }
        
        // 1. Create URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=37.7864&longitude=-122.4038&categories=restaurants&limit=10") {
            
            // 2. Create Request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // 3. Send Request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                // 4. Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
            } catch {
                print(error)
            }
        }
        return []
    }
}
