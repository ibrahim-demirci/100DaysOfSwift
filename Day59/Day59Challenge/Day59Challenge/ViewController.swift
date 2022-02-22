//
//  ViewController.swift
//  Day59Challenge
//
//  Created by İbrahim Demirci on 22.02.2022.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {

    var countries = [Datum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchCities { [weak self] cities in
            self?.countries = cities
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].city
        return cell
    }
    
    
    func fetchCities(completion: @escaping ([Datum]) -> Void) {
        AF.request("https://countriesnow.space/api/v0.1/countries/population/cities").responseDecodable(of: ResponseRoot.self) { response in
            guard let data = response.value else {
                completion([])
                return }
            
                completion(data.data)
            
            
        }
        
        
    }
    
    


}

