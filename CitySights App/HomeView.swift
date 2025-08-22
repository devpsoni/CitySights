//
//  HomeView.swift
//  CitySights App
//
//  Created by Dev Soni on 29/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedTab = 0
    
    @State var query: String = ""
    @FocusState var queryBoxFocused: Bool
    
    @State var showOptions = false // For animating the the top options panel
    
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorySelection = "Restaurants"

    var body: some View {
        
        @Bindable var model = model
        
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                    .onTapGesture {
                        queryBoxFocused = true
                        withAnimation {
                            showOptions = true
                        }
                    }
                Button {
                    withAnimation {
                        showOptions = false
                        queryBoxFocused = false
                    }
                    // Perform a search
                    model.getBusinesses(query: query, options: getOptionsString(), category: categorySelection)
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .frame(height: 32)
                }
            }
            .padding(.horizontal)
            
            // Query Options. Show if textbox is focused
            if showOptions {
                VStack{
                    Toggle("Popular", isOn: $popularOn)
                    Toggle("Deals", isOn: $dealsOn)
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker("Category", selection: $categorySelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            Text("Arts")
                                .tag("arts")
                        }
                    }
                }
                .padding(.horizontal, 40)
                .transition(.scale)
            }
            
            
            // Show Picker
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            // Show Map or List
            if model.locationAuthStatus == .denied {
                Spacer()
                Text("Please allow Location Permission for this app to see sights neat you.")
                    .padding(.horizontal)
                Button{
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Text("Open Settings")
                }
                . buttonStyle(.bordered)
                Spacer()
            }
            else if selectedTab == 1 {
                MapView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
            else {
                ListView()
                    .onTapGesture {
                        withAnimation {
                            queryBoxFocused = false
                        }
                    }
            }
            
        }
        .sheet(item: $model.selectedBusiness){ item in
            BusinessDetailView()
        }
    }
    
    func getOptionsString() -> String {
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")
        
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}
