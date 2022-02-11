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
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForInput))
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareList))
        
        navigationItem.leftBarButtonItem = clearButton
        navigationItem.rightBarButtonItems = [shareButton,addButton]
    }
    
    func addItemToList(item: String) {
        let indexPath = IndexPath(row: 0, section: 0)
        shoppingList.insert(item, at: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
    }
    
    @objc func shareList() {
        let list = shoppingList.joined(separator: "\n")
        let ac = UIActivityViewController(activityItems: [list], applicationActivities: nil)
        
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac,animated: true)
    }
    
    @objc func promptForInput() {
        let ac = UIAlertController(title: "Enter Item", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] action in
            guard let input = ac?.textFields?[0].text else { return }
            self?.addItemToList(item: input)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
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

