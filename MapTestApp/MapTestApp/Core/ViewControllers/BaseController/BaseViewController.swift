//
//  BaseViewController.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet var swipePan: UIScreenEdgePanGestureRecognizer!
    @IBOutlet weak var leftMenuButton: UIButton?
    @IBOutlet weak var rightMenuButton: UIButton?
    @IBOutlet weak var backButton: UIButton?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.menuButtonsAdjust()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Private methods
    private func menuButtonsAdjust()
    {
        if let _ = self.tabBarController {
            return
        }
        if let leftMenuButton = self.leftMenuButton {
            leftMenuButton.isHidden = true
        }
        
        if let rightMenuButton = self.rightMenuButton {
            rightMenuButton.isHidden = true
        }
        
        if let backButton = self.backButton {
            backButton.isHidden = true
        }
    }
    
}

extension BaseViewController {
    
    @IBAction func backButtonAction(_ sender:AnyObject)
    {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.backButtonAction(sender)
    }
}

// MARK: - UITextField
extension BaseViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}


extension BaseViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return (self.navigationController?.viewControllers.count)! > 1 ? true : false
    }
}

