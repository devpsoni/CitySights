//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Dev Soni on 29/07/25.
//

import SwiftUI

@main
struct CitySights: App {
    
    @State var model = BusinessModel()
    @AppStorage("onboarding") var needsOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // TODO on Dismiss
                    needsOnboarding = false
                } content: {
                    OnBoardingView()
                        .environment(model)
                }

        }
    }
}
