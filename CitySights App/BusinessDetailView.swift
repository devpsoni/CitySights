//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Dev Soni on 30/07/25.
//

import SwiftUI

struct BusinessDetailView: View {
    
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        let business = model.selectedBusiness
        VStack(spacing:0){
            ZStack (alignment: .trailing){
                Image("detail-placeholder-image")
                    .resizable()
                VStack {
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 164)
            
            if let isOpen = business?.businessHours?.first?.isOpen {
                ZStack (alignment: .leading){
                    Rectangle()
                        .foregroundColor(isOpen ? .green :.red)
                    Text(isOpen ? "Open" :"Closed")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
                .frame(height: 36)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    Text(business?.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                    
                    Text("\(business?.location?.address1 ?? ""), \(business?.location?.city ?? "")")
                    Text("\(business?.location?.zipCode ?? "") \(business?.location?.state ?? ""), \(business?.location?.country ?? "")")
                        .padding(.bottom, 10)
                    Image(RatingHelper.assetName(for: business?.rating ?? 0.0))
                        .padding(.bottom, 20)
                    
                    Divider()
                    
                    HStack(){
                        Image(systemName: "phone")
                        Text(business?.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    HStack(){
                        Image(systemName: "globe")
                        Text(business?.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    HStack(){
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ?? 0) reviews")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                }
            }
            .padding()
        }
    }
}

#Preview {
    BusinessDetailView()
}
