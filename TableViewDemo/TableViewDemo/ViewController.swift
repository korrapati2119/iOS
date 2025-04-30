//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Venkata kishore korrapati on 4/8/25.
//

import UIKit

class Product {
    var productName: String
    var productDescription: String
    init(prodName: String, prodDesc: String){
        self.productName = prodName
        self.productDescription = prodDesc
    }
}
//end of product class
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the productArray count
        return prodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a cell
        let cell = TableViewOL.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        //populate the cell with data
        cell.textLabel?.text = prodArray[indexPath.row].productName
        //return the cell
        return cell
    }
    

    @IBOutlet weak var TableViewOL: UITableView!
    var prodArray = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewOL.dataSource = self
        TableViewOL.delegate = self
        
        
        let bat1 = Product(prodName: "ceat", prodDesc: "rohits")
        prodArray.append(bat1)
        let bat2 = Product(prodName: "mrf", prodDesc: "kohlis")
        prodArray.append(bat2)
        let bat3 = Product(prodName: "sg", prodDesc: "Hardiks")
        prodArray.append(bat3)
        let bat4 = Product(prodName: "abc", prodDesc: "Suryas")
        prodArray.append(bat4)
        let bat5 = Product(prodName: "mnc", prodDesc: "Tilaks")
        prodArray.append(bat5)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "firstViewCell" {
            var destination = segue.destination as! ResultViewController
            destination.product = prodArray[(TableViewOL.indexPathForSelectedRow?.row)!]
        }
    }
}

