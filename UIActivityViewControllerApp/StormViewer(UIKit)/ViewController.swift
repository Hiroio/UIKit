//
//  ViewController.swift
//  StormViewer(UIKit)
//
//  Created by user on 23.04.2026.
//

import UIKit

class ViewController: UITableViewController {
  var pictures: [String] = []
  
  
	override func viewDidLoad() {
		super.viewDidLoad()
	  title = "Storm Viewer"
	  navigationController?.navigationBar.prefersLargeTitles = true
	  
//	  let fm = FileManager.default
//	  let path = Bundle.main.resourcePath!
//	  let items = try! fm.contentsOfDirectory(atPath: path)
	  
//	  for item in items{
//		 if item.hasPrefix("nssl"){
//			pictures.append(item)
//		 }
//	  }
	  pictures += ["nssl0033", "nssl0034", "nssl0042", "nssl0043", "nssl0045", "nssl0046", "nssl0049", "nssl0051", "nssl0091"]
	  pictures = pictures.sorted(by: {$0 < $1})
	  
	  navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
	}


  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	 return pictures.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	 let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
	 cell.textLabel?.text = pictures[indexPath.row]
	 cell.textLabel?.textColor = UIColor.blue
	 cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
	 return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	 if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
		vc.selectedImage = pictures[indexPath.row]
		vc.current = indexPath.row
		vc.total = pictures.count
		
		navigationController?.pushViewController(vc, animated: true)
	 }
  }
  
  @objc func shareTapped(){
		
	 let ac = UIActivityViewController(activityItems: ["MY APP"], applicationActivities: [])
	 
	 present(ac, animated: true)
  }
}


