//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by İbrahim Demirci on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseTouchID")
        defaults.set(CGFloat.pi, forKey: "Pi")
        
        defaults.set("Paul Hudson", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")

        let dict = ["Name": "Paul", "Country": "UK"]
        defaults.set(dict, forKey: "SavedDict")
        
        
        let arrayReaded = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
        let dictReaded = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()

        print(arrayReaded)
        print(dictReaded)
        
    }


}

