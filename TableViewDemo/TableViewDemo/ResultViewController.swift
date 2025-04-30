//
//  ResultViewController.swift
//  TableViewDemo
//
//  Created by Venkata kishore korrapati on 4/8/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var DisplayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var product: Product?
        // Do any additional setup after loading the view.
        if let product = product {
               DisplayLabel.text = "Product name is \(product.productName) and its description is \(product.productDescription)"
           } else {
               DisplayLabel.text = "No product information available."
           }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
