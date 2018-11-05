//
//  MapViewController_MapDelegate.swift
//  MapTestApp
//
//  Created by Nastya on 11/5/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import MapKit

extension MapViewController : MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = self.getCenterLocation(for: mapView)
        
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(center){ [weak self] (placemarks,error) in
            guard let self = self else {
                return
            }
            
            if let _ = error{
                return
            }
            
            guard let placemark = placemarks?.first else{
                return
            }
            
            self.changeInfoLabel(with: placemark)
            
        }
    }
    
    private func getCenterLocation(for mapView : MKMapView) -> CLLocation {
        
        let lat = mapView.centerCoordinate.latitude
        let lon = mapView.centerCoordinate.longitude
        return CLLocation(latitude: lat, longitude: lon)
    }
}
