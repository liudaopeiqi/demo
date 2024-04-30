//
//  LocationManager.swift
//  demo
//
//  Created by HONGYI LIANG on 24/4/2024.
//

import Foundation
import CoreLocation


// LocationManager class conforms to the NSObject, ObservableObject and CLLocationManagerDelegate protocols
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // create an instance of CLLocationManager to interact with the location services
    let manager = CLLocationManager()
    
    // Published properties to trigger UI updates when values change
    @Published var location: CLLocationCoordinate2D? //stores the current geographical coordinate
    @Published var isLoading = false //indicates whether location fetching is in progress
    
    override init() {
        super.init()
        manager.delegate = self //sets the locationManager as the delegate of CLLocationManager
    }
    
    //requests the current location from the devices location service
    func requestLocation() {
        isLoading = true//indicates that location request is in progress
        manager.requestLocation()//perform a one-time location request
    }
    
    //delegate method called when locations are updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate//updates the location with the first received coordinate
        isLoading = false //indicates that location fetching has completed
    }
    
    //delegate method called when an error occurs while fetching the location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)//print the error to the console
        isLoading = false//reset the loading state on error
    }
}
