//
//  Settings.swift
//  BLEExample
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya Pozdnyakova. All rights reserved.
//

import UIKit

class Settings : NSObject
{
    enum Field : String
    {
        case lastToken                  = "lastToken"
        case account                    = "account"
        
        case map               = "map"
        case service           = "service"
        case isFirst           = "isFirst"
    }
    
    // MARK: - Variables
    var storage:UserDefaults
    {
        return UserDefaults.standard
    }
    
    var lastToken:String
    {
        get{
            return self.readString(field: .lastToken)
        }
        set (value) {
            self.save(field: .lastToken, value: value)
        }
    }
    
    var isFirst:Bool
    {
        get{
            return self.readBool(field: .isFirst)
        }
        set (value) {
            self.save(field: .isFirst, value: value)
        }
    }
    
    var account:[String:Any]?
    {
        get{
            return self.readDictionary(field: .account)
        }
        set (value)
        {
            if let value = value {
                self.save(field: .account, value: value)
            }
        }
    }
    
    
    
    // MARK: - Private methods
    private func readString(field:Field) -> String {
        return self.storage.string(forKey: field.rawValue) ?? ""
    }
    private func readBool(field:Field) -> Bool {
        return self.storage.bool(forKey: field.rawValue)
    }

    private func readDictionary(field:Field) -> [String:Any]? {
        return self.storage.dictionary(forKey: field.rawValue)
    }
    
    private func save(field:Field, value:Bool)
    {
        self.storage.set(value, forKey: field.rawValue)
        self.storage.synchronize()
    }
    
    private func save(field:Field, value:[String:Any])
    {
        self.storage.set(value, forKey: field.rawValue)
        self.storage.synchronize()
    }
    
    private func save(field:Field, value:String)
    {
        self.storage.setValue(value, forKey: field.rawValue)
        self.storage.synchronize()
    }
}
