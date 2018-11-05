//
//  TutorialPageViewController.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
    
    weak var tutorialDelegate: TutorialPageViewControllerDelegate?
    var firstView: Bool = true
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        // The view controllers will be shown in this order
        return [self.newColoredViewController(color: "First"),
                self.newColoredViewController(color: "Second"),
                self.newColoredViewController(color: "Third"),
                self.newColoredViewController(color: "Fourth")]
    }()
    
    private(set) lazy var colorViewControllers: [UIColor] = {
        // The view controllers will be shown in this order
        return [Defaults.redLight,
                Defaults.yellowLight,
                Defaults.greenLight,
                Defaults.blueLight]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let initialViewController = orderedViewControllers.first {
            scrollToViewController(viewController: initialViewController)
        }
        
        tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageCount: orderedViewControllers.count)
    }
    
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController){
            scrollToViewController(viewController: nextViewController)
        }
    }

    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.index(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = orderedViewControllers[newIndex]
            scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Pager", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)ViewController")
    }
    
    /**
     Scrolls to the given 'viewController' page.
     
     - parameter viewController: the view controller to show.
     */
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true,
                           completion: { (finished) -> Void in
                            // Setting the view controller programmatically does not fire
                            // any delegate methods, so we have to manually notify the
                            // 'tutorialDelegate' of the new index.
                            self.notifyTutorialDelegateOfNewIndex()
        })
    }
    
    func notifyTutorialDelegateOfNewIndex() {
        
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
            firstViewController.view.backgroundColor = colorViewControllers[index]
            tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageIndex: index)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            tutorialPageViewController.firstView = self.firstView
        }
    }
    
}
