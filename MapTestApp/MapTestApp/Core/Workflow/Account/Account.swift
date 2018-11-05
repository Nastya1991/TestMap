//
//  Account.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import Foundation

class Account : NSObject {

    var map:Int     = MapProvider.MapEnum.Unknow.rawValue
    var service:String = ""
}

// MARK: - Methods of class
extension Account
{
    func createAccount(map:Int,service:String,isFirst : Bool = false) {
        self.map        = map
        self.service    = service

        var accountSet = [String : Any]()
        accountSet[Defaults.Strings.Map.rawValue] = map
        accountSet[Defaults.Strings.Service.rawValue] = service
        
        Settings().isFirst = isFirst
        Settings().lastToken = "lastToken"
        Settings().account   = accountSet
    }
    
    func findOldUser()->Bool{
        let defaults = UserDefaults.standard
        guard let oldUser = defaults.object(forKey: "PersonalUserData") as? [String:Any] else{
            return false
        }
        
        guard let map = oldUser[Defaults.Strings.Map.rawValue] as? Int,
            let service = oldUser[Defaults.Strings.Service.rawValue] as? String else {
                return false
        }
        
        
        self.createAccount(map: map, service: service, isFirst: false)
        return true
    }
    
}
