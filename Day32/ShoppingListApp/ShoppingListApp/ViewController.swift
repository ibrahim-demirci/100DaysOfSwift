//
//  ViewController.swift
//  ShoppingListApp
//
//  Created by İbrahim Demirci on 11.02.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping List"
        // Do any additional setup after loading the view.
        
        let clearButton = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearShoppingList))
        navigationItem.leftBarButtonItem = clearButton
    }
    
    @objc func clearShoppingList() {
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }

    
}


// TableView Overrides
extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    
}

