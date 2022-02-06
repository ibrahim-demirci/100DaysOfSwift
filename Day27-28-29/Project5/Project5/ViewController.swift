//
//  ViewController.swift
//  Project5
//
//  Created by İbrahim Demirci on 2.02.2022.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }

        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        startGame()
    }
    
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer: answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    func submit(answer: String) {
        let lowerAnswer = answer.lowercased()

        let errorTitle: String
        let errorMessage: String
        
        
        if isLonger(word: lowerAnswer){
            if isPossible(word: lowerAnswer) {
                if isOriginal(word: lowerAnswer) {
                    if isReal(word: lowerAnswer) {
                        if isDifferent(word: lowerAnswer) {
                            usedWords.insert(answer, at: 0)

                            let indexPath = IndexPath(row: 0, section: 0)
                            tableView.insertRows(at: [indexPath], with: .automatic)

                            return
                        } else {
                            errorTitle = "Same Words"
                            errorMessage = "Enter different word than the start word!"
                        }
                        
                    } else {
                        errorTitle = "Word not recognised or shorter 3 letter"
                        errorMessage = "You can't just make them up, you know!"
                    }
                } else {
                    errorTitle = "Word used already"
                    errorMessage = "Be more original!"
                }
            } else {
                guard let title = title?.lowercased() else { return }
                errorTitle = "Word not possible"
                errorMessage = "You can't spell that word from \(title)"
            }
        } else {
            errorTitle = "Word too short"
            errorMessage = "Enter longer than 3 characters!"
        }
        

        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }

           for letter in word {
               if let position = tempWord.firstIndex(of: letter) {
                   tempWord.remove(at: position)
               } else {
                   return false
               }
           }
        
           return true
    }

    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isLonger(word: String) -> Bool{
        return word.count > 3
    }
    
    func isDifferent(word: String) -> Bool {
        guard let tempWord = title?.lowercased() else { return false }
        return word != tempWord
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
            let range = NSRange(location: 0, length: word.utf16.count)
            let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

            return misspelledRange.location == NSNotFound
    }

}

