//
//  MainTabBarViewController.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit
class MainTabBarViewController : UITabBarController {
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

// MARK: - Methods of class
extension MainTabBarViewController
{
    class func instance() -> UIViewController {
        return self.controllerFromStoryboard(controllerClass: self, from: .MainTabBar)
    }
}
