//
//  ATProductCollectionViewCell.swift
//  AmaroTest
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit
import ATKit
import SDWebImage

class ATProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelName: UILabel!
    var product: ATProduct! {
        didSet {
            imageProduct.sd_setImage(with: URL(string: self.product.image!))
            labelPrice.text = product.actualPrice
            labelName.text = product.name
        }
    }
    
}
