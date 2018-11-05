//
//  TutorialViewController+TutorialPageViewControllerDelegate.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit
extension TutorialViewController: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageCount count: Int) {
        self.pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageIndex index: Int) {
        self.pageControl.currentPage = index
    }
    
    func showMainTabBarSegueSeque() {
        let account = Account.init()
        account.createAccount(map: MapProvider.MapEnum.Unknow.rawValue, service: "")
        self.performSegue(withIdentifier: "mainTabBarSegue", sender: nil)
    }
    
}
