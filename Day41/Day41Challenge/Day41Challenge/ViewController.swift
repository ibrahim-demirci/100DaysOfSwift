//
//  ViewController.swift
//  Day41Challenge
//
//  Created by İbrahim Demirci on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var healtLabel: UILabel!
    
    
    var allWords = [String]()
    var selectedWord: String? = ""
    var selectedCharacters = [Character]()
    var usedCharacters = [Character]()
    var healt = 7 {
        didSet {
            healtLabel.text = "Healt: \(healt)"
        }
    }

    
    override func loadView() {
        
        view = UIView()
        view.backgroundColor = .white
        
        healtLabel = UILabel()
        healtLabel.translatesAutoresizingMaskIntoConstraints = false
        healtLabel.textAlignment = .center
        healtLabel.text = "Healt: \(healt)"
        view.addSubview(healtLabel)
        
        NSLayoutConstraint.activate([
            
            healtLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            healtLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            healtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            healtLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        
        
        ])
        
        
    }
    
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
        var findCount = 0
        
        let str = Character(letter.capitalized)
        
        if usedCharacters.contains(str) {
            return
        }
        
        for character in selectedCharacters {
            if str == character {
                findCount += 1
                promptWord += letter
                usedCharacters.append(character)
            } else {
                promptWord += "?"
            }
        }
        
        if findCount > 0 {
            healt += findCount
            title = promptWord
            print(promptWord)
        } else {
            healt -= 1
        }
        
        
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
        if let selectedWord = selectedWord {
            title = String(repeating: "?", count: selectedWord.count)
            print(selectedWord)
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

