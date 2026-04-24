//
//  ViewController.swift
//  ShareFlag(UIKIT)
//
//  Created by user on 24.04.2026.
//

import UIKit

class ViewController: UITableViewController {
  var countries: [String] = []
  
  
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Countires"
	  navigationItem.largeTitleDisplayMode = .always
	  countries += ["Estonia", "France", "Germany", "Ireland", "Itally", "Monaco", "Nigeria", "Spain", "UK", "Ukraine", "US"]
	}

  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	 return countries.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	 let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
	 cell.textLabel?.text = countries[indexPath.row]
	 cell.textLabel?.textColor = UIColor.blue
	 cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
	 return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	 if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
		vc.selectedCountry = countries[indexPath.row]
		vc.current = indexPath.row
		vc.total = countries.count
		
		navigationController?.pushViewController(vc, animated: true)
	 }
  }

}

