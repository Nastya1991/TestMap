//
//  LocationDataProvider_ManagerDelegate.swift
//  MapTestApp
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import CoreLocation

extension LocationDataProvider:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation:CLLocation = locations[0] as CLLocation
        
        self.fetchCountryAndCity(location: currentLocation) { (country, city,address,code) in
            let coord = currentLocation.coordinate
            self.didUpdateLocations(coord, country, city, address, code)
            self.stopUpdatingLocation()
        }
        self.stopUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        var locationStatus : String? = nil
        switch status
        {
        case CLAuthorizationStatus.restricted:
            locationStatus = "Restricted Access to location"
        case CLAuthorizationStatus.denied:
            self.didUpdateLocations(nil, "", "", "", "")
            locationStatus = "User denied access to location"
        case CLAuthorizationStatus.notDetermined:
            locationStatus = "Status not determined"
        default:
            self.startUpdatingLocation()
        }
        
        guard let valueLocationStatus = locationStatus else {
            return
        }
        NSLog("Denied access: \(valueLocationStatus)")
    }
    
    // MARK: - Private
    
    func fetchCountryAndCity(location: CLLocation, completion: @escaping (String, String, String, String) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print(error)
            } else if let country = placemarks?.first?.country,
                let city = placemarks?.first?.locality,
                let address = placemarks?.first?.name,
                let code = placemarks?.first?.isoCountryCode {
                completion(country, city, address, code)
            }
        }
    }
}
