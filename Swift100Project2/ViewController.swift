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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        func askQuestion() {
            
            //
            
            countries.shuffle()
            
            // Setting image for buttons with countries in an array
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            
            // Putting correct country title in Nav bar
            
            title = countries[correctAnswer].uppercased()
            
            // Choosing the right answer
            correctAnswer = Int.random(in: 0...2)
            
            
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
            
        }
        
        askQuestion()

    }
    
    @IBAction func buttonTouched(_ sender: UIButton) {
    }
    
}

