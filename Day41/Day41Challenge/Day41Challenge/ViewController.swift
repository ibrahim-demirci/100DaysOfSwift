//
//  ViewController.swift
//  Day41Challenge
//
//  Created by İbrahim Demirci on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var allWords = [String]()
    var selectedWord: String? = ""
    var selectedCharacters = [Character]()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptAC) )
        navigationItem.rightBarButtonItem = add
        
        readFromFile()
        startGame()
        
    }
    
    @objc func promptAC() {
        let ac = UIAlertController(title: "Guess", message: "Enter a letter", preferredStyle: .alert)
        
        
        let submit = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let letter = ac?.textFields?[0].text else { return }
            self?.submit(letter)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(submit)
        ac.addAction(cancel)
        ac.addTextField()
        present(ac, animated: true)
        
    }
    
    func submit(_ letter: String) {
        var promptWord = ""
        
        let str = Character(letter.capitalized)
        
        for character in selectedCharacters {
            if str == character {
                promptWord += letter
            } else {
                promptWord += "?"
            }
        }
        title = promptWord
        print(promptWord)
        
    }
    
    
    
    
    func readFromFile() {
        if let wordsURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let words = try? String(contentsOf: wordsURL) {
                allWords = words.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["empty"]
            return
        }
    }
    
    func startGame() {
        selectedWord = allWords.randomElement()
        print(selectedWord)
        if let selectedWord = selectedWord {
            title = String(repeating: "?", count: selectedWord.count)
            selectedCharacters = selectedWord.charactersArray
        }
        
    }
}

public extension String {
    /// SwifterSwift: Array of characters of a string.
    var charactersArray: [Character] {
        return Array(self)
    }
}

