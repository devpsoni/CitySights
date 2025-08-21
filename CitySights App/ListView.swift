//
//  ListView.swift
//  CitySights App
//
//  Created by Dev Soni on 05/08/25.
//

import SwiftUI

struct ListView: View {
    
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        List {
            ForEach(model.businesses) { b in
                
                VStack {
                    HStack (spacing: 0){
                        
                        if let imageUrl = b.imageUrl{
                            // Display the Business image
                            AsyncImage(url: URL(string: imageUrl)!) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .padding(.trailing, 16)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }

                        } else {
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                        }
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
                    model.selectedBusiness = b
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environment(BusinessModel())
}
