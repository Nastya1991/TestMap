//
//  TutorialViewController.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    var firstView: Bool = true
    
    var isHidden = true{
        didSet{
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    override var prefersStatusBarHidden: Bool {
        return isHidden
    }
    
    var tutorialPageViewController: TutorialPageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.firstView{
            self.flowAcceptDecision()
            
        }
        

        pageControl.addTarget(self, action: #selector(TutorialViewController.didChangePageControlValue), for: .valueChanged)

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        UIApplication.shared.isStatusBarHidden = true
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        UIApplication.shared.isStatusBarHidden = false
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            tutorialPageViewController.firstView = self.firstView

            self.tutorialPageViewController = tutorialPageViewController
        }
    }
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
    @objc func didChangePageControlValue() {
        tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
    
    fileprivate func flow()
    {
        let vc = MainTabBarViewController.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func flowAcceptDecision()
    {
        if Settings().lastToken.filled {
            self.flow()
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        if self.firstView{
            self.showMainTabBarSegueSeque()
        }
        else{
            let _ = self.navigationController?.popViewController(animated: false)
        }
        
    }
}

extension TutorialViewController{
    class func instance() -> UIViewController {
        return self.controllerFromStoryboard(controllerClass: self, from: .Pager)
    }
}




