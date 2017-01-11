//
//  ATSize.swift
//  ATKit
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit
import RealmSwift

public class ATSize: NSObject {
    public var available: Bool!
    public var size: String!
    public var sku: String!
    
    public static func fromJson(json: NSDictionary) -> ATSize {
        let size = ATSize()
        
        if json["available"] != nil {
            size.available = json["available"] as! Bool
        }
        if json["size"] != nil {
            size.size = json["size"] as! String
        }
        if json["sku"] != nil {
            size.sku = json["sku"] as! String
        }
        
        return size
    }
}

public class ATSizeRealm: Object {
    public dynamic var available = true
    public dynamic var size: String!
    public dynamic var sku: String!
    
    static func sizeToRealm(size: ATSize) -> ATSizeRealm {
        let realm = ATSizeRealm()
        
        realm.size = size.size
        realm.sku = size.sku
        
        return realm
    }
}
