//
//  ATMainViewController.swift
//  AmaroTest
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit
import ATKit

enum ATSearchType {
    case All, Sale
}

class ATMainViewController: ATBaseViewController {
    
    var products: [ATProduct]!
    @IBOutlet weak var tableProducts: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableProducts.delegate = self
        self.tableProducts.dataSource = self
        self.loadItems(filter: .All)
    }
    
    func loadItems(filter: ATSearchType) {
        self.products = [ATProduct]()
        
        ATComunicationManager.jsonTest { (result) in
            for product in result {
                switch filter {
                case .All:
                    self.products.append(product)
                case .Sale:
                    if product.discountPercentage != "" && product.discountPercentage != nil {
                        self.products.append(product)
                    }
                }
            }
            self.tableProducts.reloadData()
        }
    }
    
    @IBAction func clickedButtonNews(_ sender: Any) {
        self.loadItems(filter: .All)
    }

    @IBAction func clickedButtonSale(_ sender: Any) {
        self.loadItems(filter: .Sale)
    }
    @IBAction func clickedButtonOrder(_ sender: Any) {
        self.performSegue(withIdentifier: "ATMainViewControllerToATOrderViewController", sender: self)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ATMainViewControllerToATProductViewController" {
            let vc = segue.destination as! ATProductViewController
            vc.product = sender as! ATProduct
        }
    }
}

extension ATMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ATProductCollectionViewCell

        cell.product = self.products[indexPath.item]
        cell.setNeedsDisplay()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ATMainViewControllerToATProductViewController", sender: self.products[indexPath.item])
    }
}
