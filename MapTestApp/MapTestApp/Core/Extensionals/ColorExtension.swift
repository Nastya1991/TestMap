//
//  ColorExtension.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

extension UIColor{
    
    class func uicolorFromHex(rgbValue:UInt32)->UIColor
    {
        return uicolorFromHex(rgbValue: rgbValue, alpha:1.0)
    }
    
    class func uicolorFromHex(rgbValue:UInt32, alpha:CGFloat)->UIColor
    {
        let red     = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green   = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue    = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:alpha)
    }
}
