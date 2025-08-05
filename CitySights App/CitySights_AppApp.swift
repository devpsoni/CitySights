//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Dev Soni on 29/07/25.
//

import SwiftUI

@main
struct CitySights_AppApp: App {
    
    @State var model = BusinessModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
