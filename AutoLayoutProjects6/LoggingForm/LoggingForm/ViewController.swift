//
//  ViewController.swift
//  LoggingForm
//
//  Created by user on 28.04.2026.
//

import UIKit

class ViewController: UIViewController {
  var login: String!
  var secure: Bool!
  var bottomLabel: UILabel!
  
  override func viewDidLoad() {
	 super.viewDidLoad()
	 // Do any additional setup after loading the view.
	 
	 secure = false
	 view.backgroundColor = .white
	 
	 
	 let loginLabel = UILabel()
	 loginLabel.text = "Login:"
	 loginLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
	 loginLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
	 
	 let loginTextField = UITextField()
	 loginTextField.borderStyle = .roundedRect
	 loginTextField.backgroundColor = .systemGray6
	 loginTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
	 loginTextField.addAction(UIAction{[weak self] _ in
		guard let self = self else {return}
		self.login = loginTextField.text ?? ""
		bottomLabel.text = "Login: " + self.login
	 }, for: .editingChanged)
	 
	 let loginRow = UIStackView(arrangedSubviews: [loginLabel, loginTextField])
	 loginRow.axis = .horizontal
	 loginRow.spacing = 15
	 loginRow.alignment = .center
	 
	 let passwordLabel = UILabel()
	 passwordLabel.text = "Password:"
	 passwordLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
	 passwordLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
	 
	 let passwordTextField = UITextField()
	 passwordTextField.borderStyle = .roundedRect
	 passwordTextField.backgroundColor = .systemGray6
	 passwordTextField.isSecureTextEntry = true
	 passwordTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
	 
	 let passwordShowButton = UIButton()
	 passwordShowButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
	 passwordShowButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
	 passwordShowButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
	 passwordShowButton.addAction(UIAction{ [weak self] _ in
		guard let self = self else {return}
		self.secure.toggle()
		passwordTextField.isSecureTextEntry = self.secure
		passwordShowButton.setImage(UIImage(systemName: self.secure ? "eye.slash" : "eye"), for: .normal)
		
	 }, for: .touchUpInside)
	 
	 let passwordRow = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField, passwordShowButton])
	 passwordRow.axis = .horizontal
	 passwordRow.spacing = 15
	 passwordRow.alignment = .center
	 
	 bottomLabel = UILabel()
	 bottomLabel.text = "Login:"
	 bottomLabel.font = .preferredFont(forTextStyle: .title2)
	 bottomLabel.textAlignment = .center
	 
	 let button = UIButton()
	 button.setTitle("Confirm", for: .normal)
	 button.layer.cornerRadius = 20
	 button.backgroundColor = UIColor.black
	 button.contentHorizontalAlignment = .center
	 
	 let verticalStack = UIStackView(arrangedSubviews: [loginRow, passwordRow, bottomLabel, button])
	 verticalStack.axis = .vertical
	 verticalStack.spacing = 20
	 verticalStack.translatesAutoresizingMaskIntoConstraints = false
	 verticalStack.isLayoutMarginsRelativeArrangement = true
	 verticalStack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
	 
	 let container = UIView()
	 container.backgroundColor = .systemGray5
	 container.layer.cornerRadius = 14
	 container.translatesAutoresizingMaskIntoConstraints = false
	 
	 view.addSubview(container)
	 container.addSubview(verticalStack)
	 
	 NSLayoutConstraint.activate([
		container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
		container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
		container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
		
		verticalStack.topAnchor.constraint(equalTo: container.topAnchor),
		verticalStack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
		verticalStack.trailingAnchor.constraint(equalTo: container.trailingAnchor),
		verticalStack.bottomAnchor.constraint(equalTo: container.bottomAnchor)
	 ])
  }
  
  
}

