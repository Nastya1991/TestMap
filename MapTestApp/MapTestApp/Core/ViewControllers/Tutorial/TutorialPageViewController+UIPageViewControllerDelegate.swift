//
//  TutorialPageViewController+UIPageViewControllerDelegate.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

extension TutorialPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        self.notifyTutorialDelegateOfNewIndex()
    }
}
