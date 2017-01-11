//
//  ATOrder.swift
//  ATKit
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit
import RealmSwift

public class ATOrder: NSObject {
    public var orderRealm: [ATOrderRealm]!
    
}

public class ATOrderRealm: Object {
    public dynamic var finalPrice: Double = 0.0
    public var products = List<ATProductRealm>()
    public var id = "1"
    
    public func removeProduct(index: Int) {
        let result = try! Realm().objects(ATOrderRealm.self)
        
        if result.count > 0 {
            try! Realm().write {
                result[0].products.remove(objectAtIndex: index)
                try! Realm().add(result[0], update: true)
            }
        }
    }
    
    public static func createOrder() -> ATOrderRealm {
        let result = try! Realm().objects(ATOrderRealm.self)
        
        if result.count > 0 {
            return result[0]
        }
        
        let newOrder = ATOrderRealm()
        try! Realm().write {
            try! Realm().add(newOrder, update: true)
        }
        return newOrder
    }
    
    public func addProduct(product: ATProduct, size: ATSize) {
        let sizeRealm = ATSizeRealm.sizeToRealm(size: size)
        let productRealm = ATProductRealm.productToRealm(product: product, sizeRealm: sizeRealm)
        
        let result = try! Realm().objects(ATOrderRealm.self)
        
        if result.count > 0 {
            try! Realm().write {
                result[0].products.append(productRealm)
                try! Realm().add(result[0], update: true)
            }
        }
    }
    
    public func getProducts() -> [ATProduct] {
        var products = [ATProduct]()
        
//        for product in self.products {
//            let productRealmTmp = product
//            let productTmp = ATProduct()
//            productTmp.fromRealm(realm: self.products[0])
//            
//            products.append(productTmp)
//        }
        
        return products
    }
    
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
