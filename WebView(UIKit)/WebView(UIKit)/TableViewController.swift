//
//  TableViewController.swift
//  WebView(UIKit)
//
//  Created by user on 27.04.2026.
//

import UIKit

class TableViewController: UITableViewController {
var webpages = ["google.com", "apple.com", "hackingwithswift.com"]
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	 webpages.count
  }

  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	 let cell = tableView.dequeueReusableCell(withIdentifier: "WebPage", for: indexPath)
	 
	 cell.textLabel?.text = webpages[indexPath.row]
	 
	 return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	 if let vc = storyboard?.instantiateViewController(withIdentifier: "Browser") as? ViewController{
		vc.currentPage = webpages[indexPath.row]
		
		navigationController?.pushViewController(vc, animated: true)
	 }
  }

}
