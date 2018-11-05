//
//  OSMViewController.swift
//  MapTestApp
//
//  Created by Nastya on 11/5/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import MapKit

class OSMViewController: BaseViewController,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var tileRenderer: MKTileOverlayRenderer!
    
    @IBOutlet var locationDataProvider: LocationDataProvider!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let template = "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
        
        let overlay = MKTileOverlay(urlTemplate: template)
        overlay.canReplaceMapContent = true
        self.mapView.addOverlay(overlay, level: .aboveLabels)
        
        self.tileRenderer = MKTileOverlayRenderer(tileOverlay: overlay)
        
        self.locationDataProvider.request()
        self.mapView.delegate = self
    }
    
    // MARK: - Action
    @IBAction func locationDataProviderAction(_ sender: LocationDataProvider) {
        
        guard let coord = sender.coordinate else{
            return
        }
        self.showMyRegion(currentLocation: coord)
        
    }
    
    func showMyRegion(currentLocation:CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: currentLocation, span: span)
        self.mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true

    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return self.tileRenderer
    }
    
}

extension OSMViewController
{
    class func instance() -> UIViewController {
        return self.controllerFromStoryboard(controllerClass: self, from: .MapOSM)
    }
}
