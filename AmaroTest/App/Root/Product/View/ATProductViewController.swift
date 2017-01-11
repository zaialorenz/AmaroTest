//
//  ATProductViewController.swift
//  AmaroTest
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit
import ATKit
import SDWebImage

class ATProductViewController: ATBaseViewController {

    var product: ATProduct!
    var selectedSize: Int = 9
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var buttonPP: UIButton!
    @IBOutlet weak var buttonP: UIButton!
    @IBOutlet weak var buttonM: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonGG: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedButtonBuy(_ sender: Any) {
        
        let productModel = ATProductModel(context: context)
        
        productModel.name = self.product.name
        productModel.style = self.product.style
        productModel.codeColor = self.product.codeColor
        productModel.colorSlug = self.product.colorSlug
        productModel.color = self.product.color
        productModel.onSale = self.product.onSale
        productModel.regularPrice = self.product.regularPrice
        productModel.actualPrice = self.product.actualPrice
        productModel.discountPercentage = self.product.discountPercentage
        productModel.installment = self.product.installments
        productModel.image = self.product.image
        productModel.selectedSize = self.product.sizes[self.selectedSize].size
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickedButtonPP(_ sender: Any) {
        if self.selectedSize == 0 {
            self.selectedSize = 9
            self.buttonPP.backgroundColor = UIColor.white
        } else {
            self.selectSize(sizeNumber: 0)
        }
    }

    @IBAction func clickedButtonP(_ sender: Any) {
        if self.selectedSize == 1 {
            self.selectedSize = 9
            self.buttonP.backgroundColor = UIColor.white
        } else {
            self.selectSize(sizeNumber: 1)
        }
    }

    @IBAction func clickedButtonM(_ sender: Any) {
        if self.selectedSize == 2 {
            self.selectedSize = 9
            self.buttonM.backgroundColor = UIColor.white
        } else {
            self.selectSize(sizeNumber: 2)
        }
    }
    
    @IBAction func clickedButtonG(_ sender: Any) {
        if self.selectedSize == 3 {
            self.selectedSize = 9
            self.buttonG.backgroundColor = UIColor.white
        } else {
            self.selectSize(sizeNumber: 3)
        }
    }
    
    @IBAction func clickedButtonGG(_ sender: Any) {
        if self.selectedSize == 4 {
            self.selectedSize = 9
            self.buttonGG.backgroundColor = UIColor.white
        } else {
            self.selectSize(sizeNumber: 4)
        }
    }
    
    func selectSize(sizeNumber: Int) {
        switch sizeNumber {
        case 0:
            self.buttonPP.backgroundColor = UIColor(hue:0.02, saturation:0.08, brightness:0.82, alpha:1.00)
            self.buttonPP.backgroundColor = UIColor.white
            self.buttonM.backgroundColor = UIColor.white
            self.buttonG.backgroundColor = UIColor.white
            self.buttonG.backgroundColor = UIColor.white
            self.buttonGG.backgroundColor = UIColor.white
        case 1:
            self.buttonP.backgroundColor = UIColor(hue:0.02, saturation:0.08, brightness:0.82, alpha:1.00)
            self.buttonP.backgroundColor = UIColor.white
            self.buttonM.backgroundColor = UIColor.white
            self.buttonG.backgroundColor = UIColor.white
            self.buttonG.backgroundColor = UIColor.white
            self.buttonGG.backgroundColor = UIColor.white
        case 2:
            self.buttonM.backgroundColor = UIColor(hue:0.02, saturation:0.08, brightness:0.82, alpha:1.00)
            self.buttonPP.backgroundColor = UIColor.white
            self.buttonP.backgroundColor = UIColor.white
            self.buttonG.backgroundColor = UIColor.white
            self.buttonGG.backgroundColor = UIColor.white
        case 3:
            self.buttonG.backgroundColor = UIColor(hue:0.02, saturation:0.08, brightness:0.82, alpha:1.00)
            self.buttonPP.backgroundColor = UIColor.white
            self.buttonM.backgroundColor = UIColor.white
            self.buttonP.backgroundColor = UIColor.white
            self.buttonGG.backgroundColor = UIColor.white
        case 4:
            self.buttonGG.backgroundColor = UIColor(hue:0.02, saturation:0.08, brightness:0.82, alpha:1.00)
            self.buttonPP.backgroundColor = UIColor.white
            self.buttonM.backgroundColor = UIColor.white
            self.buttonG.backgroundColor = UIColor.white
            self.buttonP.backgroundColor = UIColor.white
        default:
            break
        }
        
        self.selectedSize = sizeNumber
    }
    
    func configInfo() {
        self.imageProduct.sd_setImage(with: URL(string: self.product.image!))
        self.labelName.text = self.product.name
        
        if self.product.sizes[0].available == false {
            self.buttonPP.alpha = 0.5
            self.buttonPP.isUserInteractionEnabled = false
        }
        if self.product.sizes[1].available == false {
            self.buttonP.alpha = 0.5
            self.buttonP.isUserInteractionEnabled = false
        }
        if self.product.sizes[2].available == false {
            self.buttonM.alpha = 0.5
            self.buttonM.isUserInteractionEnabled = false
        }
        if self.product.sizes[3].available == false {
            self.buttonG.alpha = 0.5
            self.buttonG.isUserInteractionEnabled = false
        }
        if self.product.sizes[4].available == false {
            self.buttonGG.alpha = 0.5
            self.buttonGG.isUserInteractionEnabled = false
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
