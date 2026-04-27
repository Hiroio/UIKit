//
//  ViewController.swift
//  project6B
//
//  Created by user on 27.04.2026.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
//	  let label1 = UILabel()
//	  label1.translatesAutoresizingMaskIntoConstraints = false
//	  label1.backgroundColor = UIColor.red
//	  label1.text = "THESE"
//	  label1.sizeToFit() 
//		
//	  let label2 = UILabel()
//	  label2.translatesAutoresizingMaskIntoConstraints = false
//	  label2.backgroundColor = UIColor.yellow
//	  label2.text = "Are"
//	  label2.sizeToFit()
//		
//	  let label3 = UILabel()
//	  label3.translatesAutoresizingMaskIntoConstraints = false
//	  label3.backgroundColor = UIColor.orange
//	  label3.text = "Some"
//	  label3.sizeToFit()
//		
//	  let label4 = UILabel()
//	  label4.translatesAutoresizingMaskIntoConstraints = false
//	  label4.backgroundColor = UIColor.cyan
//	  label4.text = "Awesome"
//	  label4.sizeToFit()
//		
//	  let label5 = UILabel()
//	  label5.translatesAutoresizingMaskIntoConstraints = false
//	  label5.backgroundColor = UIColor.purple
//	  label5.text = "View"
//	  label5.sizeToFit()
	  
	  let texts = ["THESE", "Are", "Some", "Awesome", "View"]
	  let colors: [UIColor] = [.red, .yellow, .orange, .cyan, .purple]

	  var labels = [UILabel]()

	  for i in 0..<texts.count {
			let label = UILabel()
			label.text = texts[i]
			label.backgroundColor = colors[i]
			label.textAlignment = .center
			labels.append(label)
	  }
	  
//	  view.addSubview(label1)
//	  view.addSubview(label2)
//	  view.addSubview(label3)
//	  view.addSubview(label4)
//	  view.addSubview(label5)
	  
//	  let viewDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
//	  
//	  for label in viewDictionary.keys {
//		 view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [],  metrics: nil, views: viewDictionary))
//	  }
//	  
//	  let metrict = ["lHeight": 88]
//	  
//	  view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(lHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrict, views: viewDictionary))

	  
//	  var previous: UILabel?
//	  
//	  for label in [label1, label2, label3, label4, label5]{
//		 label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//		 label.heightAnchor.constraint(equalToConstant: 88).isActive = true
//		 
//		 if let previous {
//			label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
//		 } else{
//			label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
//		 }
//		 
//		 previous = label
//	  }
	  
	  let nameLabel = UILabel()
	  nameLabel.text = "Name"
	  nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
	  nameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

	  let nameField = UITextField()
	  nameField.borderStyle = .roundedRect
	  let row = UIStackView(arrangedSubviews: [nameLabel, nameField])
	  row.axis = .horizontal
	  row.spacing = 15
	  row.isLayoutMarginsRelativeArrangement = true
	  row.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
	  
	  let stack = UIStackView(arrangedSubviews: labels)
	  stack.addArrangedSubview(row)
	  stack.axis = .vertical
	  stack.spacing = 10
	  stack.distribution = .fillEqually
	  stack.translatesAutoresizingMaskIntoConstraints = false
	  
	  view.addSubview(stack)
	  NSLayoutConstraint.activate([
		stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
		stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
		stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
		stack.heightAnchor.constraint(equalToConstant: 55 * 6 + 40),
	  ])
	  
	  
	}


}

