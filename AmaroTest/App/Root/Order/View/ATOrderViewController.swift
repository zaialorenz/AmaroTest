//
//  ATOrderViewController.swift
//  AmaroTest
//
//  Created by Guilherme Lorenz on 09/01/17.
//  Copyright © 2017 GuilhermeZaia. All rights reserved.
//

import UIKit
import ATKit
import CoreData
import MGSwipeTableCell

class ATOrderViewController: ATBaseViewController {
    @IBOutlet weak var labelFinalPrice: UILabel!
    @IBOutlet weak var tableProducts: UITableView!
    
    var controller: NSFetchedResultsController<ATProductModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableProducts.delegate = self
        self.tableProducts.dataSource = self
        self.attemptFetch()
        self.loadInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInfo() {
//        self.labelFinalPrice.text = ATProduct.calculateFinalPrice(products: self.products)
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
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell") as! ATProductOrderTableViewCell

        self.configureCell(cell: cell, index: indexPath)
        
        return cell
    }
    
    func configureCell(cell: ATProductOrderTableViewCell, index: IndexPath) {
        let item = controller.object(at: index)
        cell.configureCell(product: item)
        
        cell.rightButtons = [MGSwipeButton(title: "Remover", backgroundColor: UIColor(hue:0.00, saturation:0.00, brightness:0.20, alpha:1.00), callback: { (result) -> Bool in
            context.delete(item)
            ad.saveContext()
            self.attemptFetch()
            return true
        })]
    }
}

extension ATOrderViewController: NSFetchedResultsControllerDelegate {
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<ATProductModel> = ATProductModel.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [nameSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableProducts.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableProducts.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                self.tableProducts.insertRows(at: [indexPath], with: .fade)
            }
            break
        case .delete:
            if let indexPath = indexPath {
                self.tableProducts.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            break
        }
    }
}
