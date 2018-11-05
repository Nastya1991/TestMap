//
//  MapAppleViewController.swift
//  MapTestApp
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya. All rights reserved.
//


import UIKit
import MapKit

class MapAppleViewController: MapViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.mapView.delegate = self
        
    }
}

extension MapAppleViewController
{
    class func instance() -> UIViewController {
        return self.controllerFromStoryboard(controllerClass: self, from: .MapApple)
    }
}


