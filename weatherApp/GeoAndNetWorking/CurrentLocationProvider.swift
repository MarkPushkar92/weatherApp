//
//  CurrentLocationProvider.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 11.02.2022.
//

// Completed File

import Foundation
import CoreLocation

class CurrentLocationProvider : NSObject, CLLocationManagerDelegate {
    
    private var locationManager : CLLocationManager?
    
    var locationUpdateCallback : LocationUpdateHandler?
    
    override init() {
        super.init()
        
        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // The accuracy of the location data
        locationManager.delegate = self
    }
    
    func updateLocation() {
        locationManager?.requestLocation()
    }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }

        locationUpdateCallback?(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error")
    }
}
