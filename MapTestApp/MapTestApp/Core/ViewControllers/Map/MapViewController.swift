//
//  MapViewController.swift
//  MapTestApp
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet var locationDataProvider: LocationDataProvider!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard self.locationDataProvider != nil else {
            return
        }
        self.locationDataProvider.request()
    }
    
    func changeInfoLabel(with placemark : CLPlacemark) {
        let name = placemark.name ?? ""
        let desc = placemark.description
        
        self.infoLabel.text = "\(name) : \(desc)"
    }
    
    // MARK: - Action
    @IBAction func locationDataProviderAction(_ sender: LocationDataProvider) {
        
        guard let coord = sender.coordinate else{
            return
        }
        self.showMyRegion(currentLocation: coord)
    }
    
    // MARK: - Private
    
    private func showMyRegion(currentLocation:CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: currentLocation, span: span)
        self.mapView.setRegion(region, animated: true)
    }

}
