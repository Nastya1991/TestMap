//
//  MainNavigationViewController.swift
//  MapTestApp
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    var currentMap : MapProvider.MapEnum = .Unknow
    {
        
        didSet(value)
        {
            if self.viewIfLoaded == nil{
                return
            }
            
            if self.currentMap != value {
            
                let vc = self.needController()
                
                if let lastChild = self.children.last {
                    lastChild.view.removeFromSuperview()
                    lastChild.removeFromParent()
                }
                self.view.addSubview(vc.view)
                self.addChild(vc)
                
            }
        }
        
    }
    
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let acount = Settings().account, let value = acount[Defaults.Strings.Map.rawValue] as? Int else{
            return
        }
        MapProvider.mapValueChanged(value)
        self.currentMap = MapProvider.MapEnum.byRawValue(name: value)
    }

    
    
    private func needController() -> UIViewController
    {
        switch self.currentMap
        {
        case .OSM:
             return OSMViewController.instance()
        default:
            return MapAppleViewController.instance()
        }
        
        
    }
    
}

extension MainNavigationViewController
{
    class func instance() -> UIViewController {
        return self.controllerFromStoryboard(controllerClass: self, from: .MapApple)
    }
}

