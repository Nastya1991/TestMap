//
//  OSMViewController.swift
//  MapTestApp
//
//  Created by Nastya on 11/5/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit
import MapKit

class OSMViewController: MapViewController {
    
    var tileRenderer: MKTileOverlayRenderer!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupOSM()
        self.mapView.delegate = self

    }


    private func setupOSM(){
        let template = "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
        
        let overlay = MKTileOverlay(urlTemplate: template)
        overlay.canReplaceMapContent = true
        self.mapView.addOverlay(overlay, level: .aboveLabels)
        
        self.tileRenderer = MKTileOverlayRenderer(tileOverlay: overlay)
        
        self.locationDataProvider.request()
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

