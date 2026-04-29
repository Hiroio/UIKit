//
//  UserItemViewController.swift
//  UIKitInfo
//
//  Created by user on 29.04.2026.
//

import UIKit

class UserItemViewController: UIViewController {

  let userItem: UserItem
  
  init(userItem: UserItem) {
	 self.userItem = userItem
	 super.init(nibName: nil, bundle: nil)
  }
  
  lazy var icon: UIImageView = {[weak self] in
	 $0.translatesAutoresizingMaskIntoConstraints = false
	 $0.image = UIImage(systemName: self?.userItem.icon ?? "questionmark")
	 $0.contentMode = .scaleToFill
	 return $0
  }(UIImageView())
  
  lazy var titleLabel: UILabel = { [weak self] in
	 $0.text = self?.userItem.name ?? "Unknown"
	 $0.font = UIFont.preferredFont(forTextStyle: .headline)
	 $0.textAlignment = .center
	 return $0
  }(UILabel())
  lazy var secondaryLabel: UILabel = { [weak self] in
	 $0.text = self?.userItem.surname ?? "Unknown"
	 $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
	 $0.textColor = .lightGray
	 $0.textAlignment = .center
	 return $0
  }(UILabel())
  
  override func viewDidLoad() {
	 super.viewDidLoad()
	 
	 view.backgroundColor = .white
	 let stack = UIStackView(arrangedSubviews: [icon, titleLabel, secondaryLabel])
	 stack.axis = .vertical
	 stack.translatesAutoresizingMaskIntoConstraints = false
	 stack.spacing = 15
	 
	 title = "User"
	 view.addSubview(stack)
	 print(userItem.name)
	 // Do any additional setup after loading the view.
	
	 NSLayoutConstraint.activate([
		stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
		stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
		stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
		icon.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
	 ])
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

  
  required init?(coder: NSCoder) {
	 fatalError("init(coder:) has not been implemented")
  }
}
