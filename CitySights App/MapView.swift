//
//  MapView.swift
//  CitySights App
//
//  Created by Dev Soni on 05/08/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedBusinessId: String? // becaouse the the b.id is a string
    var body: some View {
        Map(selection: $selectedBusinessId) {
            ForEach(model.businesses, id: \.id) { b in
                Marker(b.name ?? "Restaurant", coordinate: CLLocationCoordinate2D(latitude: b.coordinates?.latitude ?? 0, longitude: b.coordinates?.longitude ?? 0))
                    .tag(b.id ?? "None")
            }
        }
        .onChange(of: selectedBusinessId) { oldValue, newValue in
            // Find the Business which matched the id
            let business = model.businesses.first { business in
                business.id == newValue
            }
            
            // If the Business is not nil or if the busines is found, set it as the selected one
            if let business = business {
                model.selectedBusiness = business
            }
        }
    }
}

#Preview {
    MapView()
}
