//
//  Defaults_Storyboard.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

extension Defaults
{
    enum Storyboard : Int
    {
        case Main
        case MainTabBar
        case Pager
        case MapApple
        case MapOSM
        
        var name : String
        {
            let idents = [
                Storyboard.Main         :"Main",
                Storyboard.Pager        :"Pager",
                Storyboard.MainTabBar   :"MainTabBar",
                Storyboard.MapApple     :"MapApple",
                Storyboard.MapOSM       :"MapOSM",
                ]
            
            let storyBoardName = idents[self] ?? idents[Storyboard.Main]!
            return storyBoardName
        }
        
        static func name(val:Int) -> String {
            return Storyboard(rawValue:val)!.name
        }
    }
}
