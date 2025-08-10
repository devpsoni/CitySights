//
//  OnboardingViewDetails.swift
//  CitySights App
//
//  Created by Dev Soni on 07/08/25.
//

import SwiftUI

struct OnboardingViewDetails: View {
    
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack (spacing: 0){
                Spacer()
                Spacer()
                Image("onboarding")
                Text(headline)
                    .bold()
                    .font(.title)
                    .padding(.top, 32)
                Text(subHeadline)
                    .padding(.top, 4)
                    .padding(.horizontal)
                Spacer()
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(Color.white)
                            .frame(height: 50)
                        Text("Continue")
                            .bold(true)
                            .foregroundStyle(.black)
                    }
                    .padding(.horizontal)
                    .padding(.bottom,115)
                }
                
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to City Sights!", subHeadline: "City Sight helps you to explore the city!") {
        print("Hellp")
    }
}
