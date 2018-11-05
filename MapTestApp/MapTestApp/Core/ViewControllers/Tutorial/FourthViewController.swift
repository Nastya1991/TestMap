//
//  FourthViewController.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMainTabBarSegueSeque(_ sender: UIButton) {
        if Settings().isFirst{
            let account = Account.init()
            account.createAccount(map: MapProvider.MapEnum.Unknow.rawValue, service: "")
            self.performSegue(withIdentifier: "mainTabBarSegue", sender: nil)
        }
        else{
            let _ = self.navigationController?.popViewController(animated: false)
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
