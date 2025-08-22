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
                
                if let imageUrl = business?.imageUrl {
                    AsyncImage(url: URL(string: imageUrl)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 164)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(height: 50)
                    }

                } else {
                    Image("detail-placeholder-image")
                        .resizable()
                }
                
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
                        if let url =  URL(string: "tel:\(business?.phone ?? "")") {
                            Link(destination: url) {
                                Text(business?.phone ?? "")
                            }
                        } else {
                            Text(business?.phone ?? "")
                        }
                        Spacer()
                        Image(systemName: "arrow.right")
                        
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    HStack(){
                        Image(systemName: "globe")
                        
                        if let url = URL(string: "\(business?.url ?? "")") {
                            Link(destination: url) {
                                Text(business?.url ?? "")
                                    .lineLimit(1)
                            }
                        } else {
                            Text(business?.url ?? "")
                                .lineLimit(1)
                        }
                        
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    HStack(){
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ?? 0) reviews")
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
