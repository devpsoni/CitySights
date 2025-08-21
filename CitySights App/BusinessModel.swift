//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Dev Soni on 05/08/25.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class BusinessModel: NSObject, CLLocationManagerDelegate {
    
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business? = nil
    
    var service = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusinesses() {
        Task {
            businesses = await service.businessService(userLocation: currentUserLocation)
        }
    }
    
    func getUserLocation() {
        // Check if we have location
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            locationManager.requestLocation()
        }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Detect if user allowed, then change the location
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            manager.requestLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if currentUserLocation  == nil {
            currentUserLocation = locations.last?.coordinate
            // Call Business Search
            getBusinesses()
        }
        manager.stopUpdatingLocation()
    }
}
