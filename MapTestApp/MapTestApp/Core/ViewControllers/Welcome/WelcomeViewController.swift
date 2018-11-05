//
//  WelcomeViewController.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseViewController {

   
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.flowAcceptDecision()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        
        guard let identifierOfSegue = segue.identifier else {
            return
        }
        
        let ident = Segue(rawValue: identifierOfSegue)
        if ident == nil
        {
            let delayTime = DispatchTime.now() + Double(Int64(0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                self.flow()
            }
        }
    }
    
    // MARK: - FilePrivate
    fileprivate func flow()
    {
        let vc = MainTabBarViewController.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func flowAcceptDecision()
    {
        if Settings().lastToken.filled {
            Settings().isFirst = false
            self.flow()
        }
        else{
            if !Account().findOldUser(){
                Settings().isFirst = true
                self.performSegue(withIdentifier: Segue.PagerSegue.rawValue, sender: nil)
            }
            else{
                self.flow()
            }
            
        }
    }
    

}
