//
//  ViewController.swift
//  WordScramble(UIKit)
//
//  Created by user on 27.04.2026.
//

import UIKit

class ViewController: UITableViewController {
  var words: [String] = []
  var usedWords: [String] = []
  var userInput = ""
  
	override func viewDidLoad() {
		super.viewDidLoad()
	  
	  let url = Bundle.main.url(forResource: "start", withExtension: ".txt")
	  
	  if let url{
		 if let words = try? String(contentsOf: url, encoding: .utf8){
			let splitWords = words.components(separatedBy: "\n")
			self.words = splitWords
		 }
	  }
	  
	  if words.isEmpty{
		 words = ["silkworm"]
	  }
	  
	  startGame()
	  
	  
	  navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWord))
	  navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startGame))
		// Do any additional setup after loading the view.
	}
  
 @objc func startGame(){
	 title = words.randomElement()
	 usedWords.removeAll()
	 tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	 usedWords.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	 let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
	 cell.textLabel?.text = usedWords[indexPath.row]
	 return cell
  }
  
  
  @objc func addWord(){
	 let ac = UIAlertController(title: "Enter the word", message: nil, preferredStyle: .alert)
	 
	 ac.addTextField { textfield in
		self.userInput = textfield.text ?? ""
	 }
	 ac.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self, weak ac] action in
		guard let answer = ac?.textFields?.first?.text else { return }
		self?.submit(answer)
	 }))
	 
	 present(ac, animated: true)
  }
  
  
  func submit(_ text: String) {
	 let lower = text.lowercased()
	 let errorTitle: String
	 let errorMessage:String
	 
	 
	 if isPossible(word: lower) && isOriginal(word: lower) && isReal(word: lower){
		usedWords.insert(text, at: 0)
		
		let indexpath = IndexPath(row: 0, section: 0)
		tableView.insertRows(at: [indexpath], with: .top)
	 }else{
		  errorTitle = "Word not recognize"
		errorMessage = "Time to buy vocabluary"
		
		let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
		
		ac.addAction(UIAlertAction(title: "Okey", style: .default))
		present(ac, animated: true)
	 }
	 
  }
  
  func isPossible(word: String) -> Bool{
	 guard var tempword = title?.lowercased() else { return false }
	 for letter in word{
		if let index = tempword.firstIndex(where: {letter == $0}){
		  tempword.remove(at: index)
		}else{
		  return false
		}
	 }
	 return true
  }
  func isOriginal(word: String) -> Bool{
	 return !usedWords.contains(where: {$0.lowercased() == word})
  }
  
  func isReal(word: String) -> Bool{
	 let checker = UITextChecker()
	 let range = NSRange(location: 0, length: word.utf16.count)
	 let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
	 return misspelledRange.location == NSNotFound
  }
  
}

