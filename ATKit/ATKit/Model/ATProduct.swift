//
//  ATProduct.swift
//  ATKit
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit

public class ATProduct: NSObject {
    public var name: String!
    public var style: String!
    public var codeColor: String!
    public var colorSlug: String!
    public var color: String!
    public var onSale: Bool!
    public var regularPrice: String!
    public var actualPrice: String!
    public var discountPercentage: String!
    public var installments: String!
    public var image: String!
    public var sizes: [ATSize]!
    public var selectedSize: String!
    
    public static func fromJson(json: NSDictionary) -> ATProduct {
        let product = ATProduct()
        
        if json["name"] != nil {
            product.name = json["name"] as! String
        }
        if json["style"] != nil {
            product.style = json["style"] as! String
        }
        if json["code_color"] != nil {
            product.codeColor = json["code_color"] as! String
        }
        if json["color_slug"] != nil {
            product.colorSlug = json["color_slug"] as! String
        }
        if json["color"] != nil {
            product.color = json["color"] as! String
        }
        if json["on_sale"] != nil {
            product.onSale = json["on_sale"] as! Bool
        }
        if json["regular_price"] != nil {
            product.regularPrice = json["regular_price"] as! String
        }
        if json["actual_price"] != nil {
            product.actualPrice = json["actual_price"] as! String
        }
        if json["discount_percentage"] != nil {
            product.discountPercentage = json["discount_percentage"] as! String
        }
        if json["installments"] != nil {
            product.installments = json["installments"] as! String
        }
        if json["image"] != nil {
            product.image = json["image"] as! String
        }
        if json["sizes"] != nil {
            if json["sizes"] is NSArray {
                for size in json["sizes"] as! NSArray {
                    let sizeTmp: ATSize = ATSize.fromJson(json: size as! NSDictionary)
                    if product.sizes == nil {
                        product.sizes = [ATSize]()
                    }
                    product.sizes.append(sizeTmp)
                }
            }
        }
        
        return product
    }
    
    public func saveProduct() {
        
    }
    
    public static func getProducts(json: NSArray) -> [ATProduct] {
        var products = [ATProduct]()
        
        for product in json {
            if product is NSDictionary {
                products.append(ATProduct.fromJson(json: product as! NSDictionary))
            }
        }
        
        return products
    }
    
    public static func getProductList() -> [ATProduct] {
        var products = [ATProduct]()
        
        
        return products
    }
    
    public static func calculateFinalPrice(products: [ATProduct]) -> String {
        var price: Double = 0.0
        for product in products {
            price += product.actualPrice.getPrice()
        }
        
        return "Valor Final: \(price.roundTo(places: 2))"
    }
    
    public func removeProduct(inde: Int) {
        
        
    }
}

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
