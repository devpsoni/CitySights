//
//  ContentView.swift
//  CitySights App
//
//  Created by Dev Soni on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    
    var body: some View {
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
        .onAppear() {
            print(Bundle.main.infoDictionary?["API_KEY"] as? String)
        }
    }
}

#Preview {
    ContentView()
}
