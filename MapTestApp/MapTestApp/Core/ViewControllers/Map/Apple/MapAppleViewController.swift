//
//  MapAppleViewController.swift
//  MapTestApp
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya. All rights reserved.
//


import UIKit
import MapKit


class MapAppleViewController: BaseViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet var locationDataProvider: LocationDataProvider!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.locationDataProvider.request()
    }
    
    // MARK: - Action
    @IBAction func locationDataProviderAction(_ sender: LocationDataProvider) {
        
        guard let coord = sender.coordinate else{
            return
        }
        self.showMyRegion(currentLocation: coord)
    }
    
    // MARK: - Private
    
    func showMyRegion(currentLocation:CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: currentLocation, span: span)
        self.mapView.setRegion(region, animated: true)
    }
    
}

extension MapAppleViewController
{
    class func instance() -> UIViewController {
        return self.controllerFromStoryboard(controllerClass: self, from: .MapApple)
    }
}
