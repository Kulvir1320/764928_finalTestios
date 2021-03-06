//
//  ViewController.swift
//  764928_finalTestios
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var desTextView: UITextView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
     var products: [Product]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let product1 = Product(id: 1, name: "Water Bottle", description: "Keep water warm and hot", price: 20)
               let product2 = Product(id: 2, name: "moblie phone", description: "samsung s1", price: 1000)
               let product3 = Product(id: 3, name: "bag", description: "roots", price: 100)
                let product4 = Product(id: 4, name: "hair band", description: "color pink", price: 10)
                let product5 = Product(id: 5, name: "lunch box", description: " it contains two boxes ", price: 25)
                let product6 = Product(id: 6, name: "chair", description: "colr grey", price: 50)
                let product7 = Product(id: 7, name: "table", description: "colr black", price: 70)
                let product8 = Product(id: 8, name: "macbook", description: "model -2019", price: 2000)
                let product9 = Product(id: 9, name: "pens", description: "it has packs of ten pens", price: 10)
                let product10 = Product(id: 10, name: "shoes", description: "clor black", price: 150)
               
               products = [product1, product2,product3,product4,product5,product6,product7,product8,product9,product10]
        for item in products! {
            Product.product.append(item)
        }
       
        idTextField.text = "\(product1.id)"
        desTextView.text = "\(product1.description)"
        priceTextField.text = "\(product1.price)"
        nameTextField.text = "\(product1.name)"
        
         NotificationCenter.default.addObserver(self, selector: #selector(saveData), name: UIApplication.willResignActiveNotification, object: nil)
    }
    @objc func saveData() {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        for item in products! {
            let entity = NSEntityDescription.insertNewObject(forEntityName: "ProductEntity", into: context)
            entity.setValue(item.name, forKey: "name")
            entity.setValue(item.id, forKey: "id")
            entity.setValue(item.description, forKey: "desc")
            entity.setValue(item.price, forKey: "price")
            do {
                           try context.save()
                       } catch {
                           print(error)
                       }
            
        }
    }

    
    @IBAction func savebutton(_ sender: UIBarButtonItem) {
        
    }
    

}

