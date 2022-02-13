//
//  ViewController.swift
//  Day41Challenge
//
//  Created by İbrahim Demirci on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var allWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let wordsURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let words = try? String(contentsOf: wordsURL) {
                allWords = words.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["empty"]
            return
        }
        
        
        print(allWords)
    }
    
    


}

