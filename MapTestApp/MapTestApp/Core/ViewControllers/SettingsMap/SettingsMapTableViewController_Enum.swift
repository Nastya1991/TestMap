//
//  SettingsMapTableViewController_Enum.swift
//  MapTestApp
//
//  Created by Nastya on 11/4/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

extension SettingsMapTableViewController{
    
    enum CellTag : Int
    {
        case mapValuesCell = 1
    }

    enum CellIdent : Int
    {
        case MapValuesCell
        
        var name:String
        {
            let idents = [
                CellIdent.MapValuesCell            :"MapValuesCell",
                
                
            ]
            return idents[self] ?? idents[CellIdent.MapValuesCell]!
        }
        
        static func name(val:Int) -> String {
            return CellIdent(rawValue:val)!.name
        }
    }
}
