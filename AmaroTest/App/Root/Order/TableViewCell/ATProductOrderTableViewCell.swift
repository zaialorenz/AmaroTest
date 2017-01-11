//
//  ATProductOrderTableViewCell.swift
//  AmaroTest
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit
import ATKit
import MGSwipeTableCell

class ATProductOrderTableViewCell: MGSwipeTableCell {
    
    var product: ATProduct! 

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelSize: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(product: ATProductModel) {
        self.labelName.text = product.name
        self.labelSize.text = "Tamanho: \(product.selectedSize)"
        self.labelValue.text = product.actualPrice
    }
    
    

}
