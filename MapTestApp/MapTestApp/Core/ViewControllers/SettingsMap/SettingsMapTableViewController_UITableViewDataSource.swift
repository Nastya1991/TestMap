//
//  SettingsMapTableViewController_UITableViewDataSource.swift
//  MapTestApp
//
//  Created by Nastya on 11/4/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

extension SettingsMapTableViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ident = self.identOfCell(indexPath: indexPath)
        let cell  = tableView.dequeueReusableCell(withIdentifier: ident, for: indexPath) as UITableViewCell
        self.mapCellDecorator(cell, indexPath)
        return cell
    }
    
    private func identOfCell(indexPath: IndexPath) -> String
    {
        switch indexPath.row {
        case 0:
            return CellIdent.MapValuesCell.name
        default:
            return CellIdent.MapValuesCell.name
        }
    }
    
    private func mapCellDecorator(_ cell:UITableViewCell, _ indexPath: IndexPath)
    {
        guard cell.reuseIdentifier == CellIdent.MapValuesCell.name else {
            return
        }
        
        
        if let label = cell.viewWithTag(CellTag.mapValuesCell.rawValue) as? UILabel
        {
            guard let acount = Settings().account else{
                return
            }
            let mapEnumValue : MapProvider.MapEnum  = MapProvider.MapEnum.byRawValue(name: acount[Defaults.Strings.Map.rawValue] as! Int)
            label.text  = mapEnumValue.name
        }
    }
        
        
}

