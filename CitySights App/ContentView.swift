//
//  ContentView.swift
//  CitySights App
//
//  Created by Dev Soni on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var businesses = [Business]()
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                Button {
                    // TODO: Implement Query
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            List (businesses) { business in
                Text(business.name ?? "No Name")
            }
        }
        .task {
            businesses = await service.businessService()
        }
    }
}

#Preview {
    ContentView()
}
