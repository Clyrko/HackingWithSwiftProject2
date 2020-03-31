//
//  ViewController.swift
//  Swift100Project2
//
//  Created by Jay A. on 3/31/20.
//  Copyright © 2020 Jay A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var questionCount = 1
    let questionLimit = 10
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // Setting border for buttons
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // Setting border color for buttons
        button1.layer.borderColor = UIColor.white.cgColor
        button2.layer.borderColor = UIColor.white.cgColor
        button3.layer.borderColor = UIColor.white.cgColor
        
        // Setting corner radius for the buttons
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
        button3.layer.cornerRadius = 10
        
        askQuestion()

    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        // Shuffle the order of countries
        countries.shuffle()
        
        // Setting image for buttons with countries in an array
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // Choosing the right answer
        correctAnswer = Int.random(in: 0...2)
        
        // Putting correct country title in Nav bar
        let correctCountryChoice = countries[correctAnswer].uppercased()
        title = "Current Score: \(score) , Pick: \(correctCountryChoice)"
        
    }
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            
            title = "Correct!"
            score += 1
            
        } else {
            
            title = "Wrong"
            score -= 1
            
        }
        
        if questionCount < questionLimit {
            
            let ac = UIAlertController(title: title, message: "Your current score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            questionCount += 1
            
        } else {
            
            let ac = UIAlertController(title: title, message: "You have answered 10 questions, you got \(score) correct!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "End Game", style: .default, handler: askQuestion))
            present(ac, animated: true)
            questionCount = 1
            score = 0
            
        }
        
    }
    
}

