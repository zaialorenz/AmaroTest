//
//  ATOrder.swift
//  ATKit
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit

public class ATOrder: NSObject {
    public var products: [ATProductOrder]!
    public var finalPrice: Double = 0.0
    
    public func addProduct(product: ATProduct) {
        let newProduct = ATProductOrder()
        
        newProduct.product = product
        newProduct.quantity = 1
        self.finalPrice += product.actualPrice.getPrice()
    }
    
    public func removeProduct(product: ATProduct) {
        for item in self.products {
            if item.product == product {
                if item.quantity > 0 {
                    self.products[self.products.index(of: item)!].quantity = item.quantity - 1
                }
            }
        }
    }
    
    public func addSame(product: ATProduct) {
        for item in self.products {
            if item.product == product {
                self.products[self.products.index(of: item)!].quantity = item.quantity + 1
            }
        }
    }
}
