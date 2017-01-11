//
//  ATComunicationManager.swift
//  ATKit
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit

public class ATComunicationManager: NSObject {
    public static func jsonTest(sucess: ([ATProduct]) -> Void) {
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                    
                    if dictionary?["products"] is NSArray {
                        let products = ATProduct.getProducts(json: dictionary?["products"] as! NSArray)
                        sucess(products)
                    }
                    
                } catch {
                    print("Error!!")
                }
            }
        }
    }
}
