//
//  SettingsMapTableViewController.swift
//  MapTestApp
//
//  Created by Nastya on 11/4/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

protocol SettingsMapTableViewControllerDelegate : class {
    func showMapView()
}

class SettingsMapTableViewController: UITableViewController {

    weak var delegate: SettingsMapTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action
    @IBAction func chooseMapAction(_ sender: UIButton) {
        self.delegate?.showMapView()
    }


}
