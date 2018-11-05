//
//  ViewControllerExtension.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

extension UIViewController{
    class func controllerFromStoryboard(controllerClass:AnyClass, from storyboard:Defaults.Storyboard) -> UIViewController
    {
        let identController = "\(controllerClass)"
        return self.controllerFromStoryboard(controllerName:identController, from:storyboard.name)
    }
    
    class func controllerFromStoryboard(controllerName:String, from storyboardName:String) -> UIViewController
    {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: controllerName)
    }
    
    class func rootTabbarViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
    {
        if let nav = base as? UINavigationController {
            return rootTabbarViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return tab
        }
        if let presented = base?.presentedViewController {
            return rootTabbarViewController(base: presented)
        }
        return base
    }
}

