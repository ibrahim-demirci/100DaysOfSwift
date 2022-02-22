//
//  DetailTableViewController.swift
//  Day59Challenge
//
//  Created by İbrahim Demirci on 22.02.2022.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var cityInformations = [PopulationCount]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityInformations.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        cell.textLabel?.text = "Year: \(cityInformations[indexPath.row].year)"
        cell.detailTextLabel?.text = "Population: \(cityInformations[indexPath.row].value!)"
        return cell
        
    }

   
}
