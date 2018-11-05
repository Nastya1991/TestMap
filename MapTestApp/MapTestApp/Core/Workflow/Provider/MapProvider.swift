//
//  MapProvider.swift
//  MapTestApp
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

class MapProvider: NSObject {
    
    var mapValue = MapEnum.Apple
    {
        didSet(oldValue)
        {
            MapProvider.mapValueChanged(oldValue.rawValue)
        }
    }
    
    enum MapEnum : Int
    {
        case Apple
        case OSM
        case Unknow
        
        var name : String
        {
            let idents = [
                MapEnum.Apple:"Apple",
                MapEnum.OSM:"OSM",
                ]
            return idents[self] ?? idents[MapEnum.Apple]!
        }
        
        static func byRawValue(name:Int) -> MapEnum
        {
            let array = [MapEnum.Apple.rawValue:MapEnum.Apple,
                         MapEnum.OSM.rawValue:MapEnum.OSM,]
            return array[name] ?? MapEnum.Apple
        }
        
    }
    
    

    
    static func mapValueChanged(_ newValue : Int)
    {
        
        let account = Account.init()
        account.createAccount(map: newValue, service: account.service, isFirst: false)
    }

}
