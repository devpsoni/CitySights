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
    @State var selectedBusiness: Business? = nil
    
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
            List {
                ForEach(businesses) { b in
                    
                    VStack {
                        HStack (spacing: 0){
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                            VStack (alignment: .leading){
                                Text(b.name ?? "Restaurant")
                                    .font(.headline)
                                Text(Texthelper.distanceAwayText(meters: b.distance ?? 0))
                                    .font(Font.system(size: 16))
                                    .foregroundColor(.secondary)
                            }
                            .padding(.bottom, 20)
                            Spacer()
                            Image(RatingHelper.assetName(for: b.rating ?? 0.0))
                        }
                        Divider()
                    }
                    .onTapGesture {
                        selectedBusiness = b
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .task {
            businesses = await service.businessService()
        }
        .sheet(item: $selectedBusiness){ item in
            BusinessDetailView(business: item)
        }
    }
}

#Preview {
    ContentView()
}
