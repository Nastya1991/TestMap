//
//  LocationDataProvider.swift
//  MapTestApp
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import CoreLocation

class LocationDataProvider: DataProvider {
    
    var locationManager: CLLocationManager?
    var coordinate: CLLocationCoordinate2D?
    var city: String = ""
    var country: String = ""
    var address: String = ""
    var code: String = ""
    
    override func request()
    {
        self.locationManager = CLLocationManager()
        self.locationManager!.delegate = self
        self.locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager!.requestWhenInUseAuthorization()
    }
    
    func start() {
        guard let _ = self.locationManager else{
            return
        }
        self.locationManager!.startUpdatingLocation()
    }
    
    func didUpdateLocations(_ coordinate: CLLocationCoordinate2D?, _ country:String, _ city:String, _ address:String, _ countryCode:String) {
        
        self.coordinate = coordinate
        self.country = country
        self.city = city
        self.address = address
        self.code = countryCode
        self.fetch()
    }
    
    func stopUpdatingLocation() {
        guard let _ = self.locationManager else{
            return
        }
        //        self.locationManager!.stopUpdatingLocation()
    }
    
    func startUpdatingLocation() {
        guard let _ = self.locationManager else{
            return
        }
        self.locationManager!.startUpdatingLocation()
    }
    
    
    override func fetch()
    {
        self.data = self.city as AnyObject
    }
    
}
