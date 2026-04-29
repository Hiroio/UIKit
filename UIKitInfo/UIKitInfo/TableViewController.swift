//
//  TableViewController.swift
//  UIKitInfo
//
//  Created by user on 29.04.2026.
//

import UIKit

struct UserItem: Identifiable{
  let id: UUID = UUID()
  let name: String
  let surname: String
  let icon: String = "person.fill"
  
  static func mockData() -> [UserItem]{
	 [UserItem(name: "Qwe", surname: "Qeewq"), UserItem(name: "QTee", surname: "Rqwe"), UserItem(name: "Rqwe", surname: "Tqwe"), UserItem(name: "DQweqw", surname: "DSqwe"), UserItem(name: "ASqwes", surname: "QWEfds"), UserItem(name: "QWdsAwq", surname: "ASDQwes"), UserItem(name: "Qswed", surname: "Sqwea")]
  }
}

class TableViewController: UIViewController {

  var users: [UserItem] = UserItem.mockData()
  
  lazy var tableView: UITableView = {
	 $0.register(UITableViewCell.self, forCellReuseIdentifier: "main")
	 $0.dataSource = self
	 $0.delegate = self
	 return $0
  }(UITableView(frame: view.frame, style: .insetGrouped))
  
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Users"
		
		view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension TableViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	 users.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	 let cell = tableView.dequeueReusableCell(withIdentifier: "main", for: indexPath)
	 let user = users[indexPath.row]
	 var config = cell.defaultContentConfiguration()
	 config.text = user.name
	 config.secondaryText = user.surname
	 config.image = UIImage(systemName: user.icon)

	 cell.contentConfiguration = config
	 return cell
  }
}


extension TableViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	 let vc = UserItemViewController(userItem: users[indexPath.row])
	 
	 navigationController?.pushViewController(vc, animated: true)
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
	 if editingStyle == .delete{
		users.remove(at: indexPath.row)
		tableView.deleteRows(at: [indexPath], with: .automatic)
	 }
  }
}
