//
//  StringExt.swift
//  ATKit
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import Foundation

extension String{
    mutating func getPrice() -> Double {
        self = self.replacingOccurrences(of: "R$ ", with: "")
        self = self.replacingOccurrences(of: ",", with: ".")
        
        return Double(self)!
    }
}
