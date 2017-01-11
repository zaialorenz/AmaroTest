//
//  ATOrderViewController.swift
//  AmaroTest
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit
import ATKit
import MGSwipeTableCell

class ATOrderViewController: ATBaseViewController {
    var order: ATOrderRealm!
    var products = [ATProduct]()
    @IBOutlet weak var labelFinalPrice: UILabel!
    @IBOutlet weak var tableProducts: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.order = ATOrderRealm.createOrder()
        self.tableProducts.delegate = self
        self.tableProducts.dataSource = self
        self.loadInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInfo() {
        self.products = self.order.getProducts()
        self.tableProducts.reloadData()
        self.labelFinalPrice.text = "\(self.order.finalPrice)"
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

extension ATOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.order.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell") as! ATProductOrderTableViewCell
        
        cell.rightButtons = [MGSwipeButton(title: "Remover", backgroundColor: UIColor(hue:0.00, saturation:0.00, brightness:0.20, alpha:1.00), callback: { (result) -> Bool in
            self.order.removeProduct(index: indexPath.row)
            return true
        })]

        cell.labelName.text = self.products[indexPath.row].name
        cell.labelValue.text = self.products[indexPath.row].actualPrice
        //cell.labelSize.text = "Tamanho: \(self.order.products[indexPath.row].size.size ?? "")"
        
        return cell
    }
}
