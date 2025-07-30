//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Dev Soni on 30/07/25.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "No Business")
    }
}

#Preview {
    BusinessDetailView()
}
