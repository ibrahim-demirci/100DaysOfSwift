//
//  ViewController.swift
//  Day59Challenge
//
//  Created by İbrahim Demirci on 22.02.2022.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {

    private var activityIndicator: UIActivityIndicatorView!

    var countries = [Datum]()
    var cityDetails = [PopulationCount]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Cities Information"
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        navigationItem.setRightBarButton(UIBarButtonItem(customView: activityIndicator) , animated: true)
        activityIndicator.color = .green
        
        
        
        fetchCities { [weak self] cities in
            self?.activityIndicator.stopAnimating()
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
        activityIndicator.startAnimating()
        AF.request("https://countriesnow.space/api/v0.1/countries/population/cities").responseDecodable(of: ResponseRoot.self) { response in
            guard let data = response.value else {
                completion([])
                return }
                completion(data.data)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storybard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storybard.instantiateViewController(withIdentifier: "DetailVC") as! DetailTableViewController
        
        vc.cityInformations = countries[indexPath.row].populationCounts
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    


}

