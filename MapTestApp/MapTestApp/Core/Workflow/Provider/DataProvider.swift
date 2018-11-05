//
//  DataProvider.swift
//  MapTestApp
//
//  Created by Nastya on 11/3/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

class DataProvider : UIControl {
    
    typealias Invalidated = DataProvider

    
    var data:AnyObject?
    {
        didSet
        {
            DispatchQueue.main.async
                {
                    self.sendActions(for: .valueChanged)
            }
        }
    }
    
    
    convenience init(response:AnyObject?)
    {
        self.init()
        
        if let response = response {
            print("INVALID DATA of \(self.classForCoder)\n\(response)")
        } else {
            print("RESPONSE IS NULL \(self.classForCoder)")
        }
    }
    
    // MARK: - Virtual methods
    func request() {
    }
    
    func parse(response:AnyObject?) -> DataProvider {
        return self
    }
    func fetch() {
    }
    
    
}
