//
//  WelcomeViewController_Enums.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

extension WelcomeViewController{
    
    enum Segue:String
    {
        case PagerSegue         = "pagerSegue"
    }
    
    enum CellIdent : Int
    {
        case PagerSegue
        var name : String
        {
            let idents = [
                CellIdent.PagerSegue:"pagerSegue",
                ]
            return idents[self] ?? idents[CellIdent.PagerSegue]!
        }
        
        static func name(val:Int) -> String {
            return CellIdent(rawValue:val)!.name
        }
    }
    
    enum CellTag : Int
    {
        case label  = 1
    }
    
}
