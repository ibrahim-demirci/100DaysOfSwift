//
//  ViewController.swift
//  Project2
//
//  Created by İbrahim Demirci on 26.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var askedQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        if askedQuestions == 2 {
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            presentFinalAlert()
            return
        }
        askedQuestions += 1
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " Score: \(score)"

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            score += 1
            presentCorrectAlert()
            
        } else {
            score -= 1
            presentWrongAlert(tag: sender.tag)
            
        }
    }
    
    
    func presentFinalAlert() {
        
        let ac = UIAlertController(title: "Final", message: "Final Score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Finish", style: .default, handler: nil))
        present(ac, animated: true)
    }

    func presentWrongAlert(tag: Int){
        let ac = UIAlertController(title: "Wrong", message: "Wrong! That's  \(countries[tag]).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    func presentCorrectAlert(){
        let ac = UIAlertController(title: "Correct", message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    

}

