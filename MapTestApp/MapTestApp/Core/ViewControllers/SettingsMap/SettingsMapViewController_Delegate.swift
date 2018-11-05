//
//  SettingsMapViewController_Delegate.swift
//  MapTestApp
//
//  Created by Nastya on 11/4/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

extension SettingsMapViewController : ChooseValueViewDelegate, SettingsMapTableViewControllerDelegate{
    
    func showMapView(){

        let screenshot = UIViewController.rootTabbarViewController()?.view.screenshot
        
        let _ = ChooseValueView.instance(image: screenshot!, pickerData: self.mapList, delegate: self)
    }
    
    func chooseValuePressed(anyValue:Any?){
        guard let value = anyValue else {
            return
        }
        
        if let value = value as? MapTypealias{
            let account = Account.init()
            account.createAccount(map: value.description, service: account.service, isFirst: false)
        }
        
        
        self.settingsMapTableView.tableView.reloadData()
        
        
    }
}
