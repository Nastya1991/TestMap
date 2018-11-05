//
//  SettingsMapViewController.swift
//  MapTestApp
//
//  Created by Nastya on 11/4/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

typealias MapTypealias = (title:String, description:Int)

class SettingsMapViewController: BaseViewController {
    
    var mapList : [MapTypealias] = [MapTypealias(title:"Apple", description:0), MapTypealias(title:"Gis", description:1)]
    
    var settingsMapTableView : SettingsMapTableViewController!
    
    enum Segue:String {
        case SettingsMapSeque = "settingsMapSeque"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let identifierOfSegue = segue.identifier else {
            return
        }
        
        let ident = Segue.init(rawValue: identifierOfSegue)
        if ident == Segue.SettingsMapSeque {
            if let vc = segue.destination as? SettingsMapTableViewController {
                self.settingsMapTableView = vc
                self.settingsMapTableView.delegate = self
            }
            
            
        }
    }

}

