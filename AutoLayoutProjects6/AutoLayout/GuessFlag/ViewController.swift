//
//  ViewController.swift
//  GuessFlag
//
//  Created by user on 24.04.2026.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var button1: UIButton!
  @IBOutlet var button2: UIButton!
  @IBOutlet var button3: UIButton!
  
  var countries: [String] = []
  var score = 0
  var question = 0
  var correctAnswer = 0
  
	override func viewDidLoad() {
		super.viewDidLoad()
	  
	  
	  countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

	  askQuestion()
	  
	  button1.layer.borderWidth = 1
	  button2.layer.borderWidth = 1
	  button3.layer.borderWidth = 1
	  
	  button1.tag = 0
	  button2.tag = 1
	  button3.tag = 2
	  
	  button1.layer.borderColor = UIColor.lightGray.cgColor
	  button2.layer.borderColor = UIColor.lightGray.cgColor
	  button3.layer.borderColor = UIColor.lightGray.cgColor
	  
	  navigationItem.rightBarButtonItem = UIBarButtonItem(title: "score", style: .plain, target: self, action: #selector(showScore))
	}


  func askQuestion(action: UIAlertAction! = nil) {
	 countries.shuffle()
	 
	 correctAnswer = Int.random(in: 0...2)
	 question += 1
	 
	 button1.setImage(UIImage(named: countries[0]), for: .normal)
	 button2.setImage(UIImage(named: countries[1]), for: .normal)
	 button3.setImage(UIImage(named: countries[2]), for: .normal)
	 
	 title = countries[correctAnswer].uppercased() + "\nQuestion #\(question)"
	 
  }
  
  @IBAction func buttonTapped(_ sender: UIButton) {
	 var alertTitle: String
	 
	 
	 
	 if sender.tag == correctAnswer{
		score += 1
		alertTitle = "Correct!"
	 }else{
		score -= 1
		alertTitle = "Wrong! Thats a flag of \(countries[sender.tag].uppercased())"
	 }
	 var ac = UIAlertController(title: alertTitle, message: "Your current score is: \(score)", preferredStyle: .alert)
	 
	 if question != 10{
		ac.title = alertTitle
		ac.message = "Your current score is: \(score)"
		ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
	 }else{
		ac.title = "Congratulation"
		ac.message = "You completed 10 questions\nYour score is: \(score)"
		ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
	 }
	 
	 present(ac, animated: true)
  }
  
  @objc func showScore(){
	 let ac = UIAlertController(title: "Your Score is: \(score)",message: nil, preferredStyle: .alert)
	 
	 ac.addAction(UIAlertAction(title: "Ok", style: .default))
	 
	 present(ac, animated: true)
  }
  
}

