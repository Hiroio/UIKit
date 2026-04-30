//
//  ViewController.swift
//  ScrollView(UIKit)
//
//  Created by user on 30.04.2026.
//

import UIKit

class ViewController: UIViewController {

  lazy var scrollView: UIScrollView = {
			 let scroll = UIScrollView()
			 scroll.translatesAutoresizingMaskIntoConstraints = false
			 return scroll
		}()
		
		lazy var stack: UIStackView = {
			 let stack = UIStackView()
			 stack.axis = .vertical
			 stack.spacing = 15
			 stack.translatesAutoresizingMaskIntoConstraints = false
			 return stack
		}()
  
	override func viewDidLoad() {
		super.viewDidLoad()
	  
	  view.backgroundColor = .white
	  scrollView.delegate = self
	  
	  scrollView.addSubview(stack)
	  view.addSubview(scrollView)
	  
	
	  for i in 1...100{
		 if i == 20{
			let image = createImage()
			image.translatesAutoresizingMaskIntoConstraints = false
			stack.addArrangedSubview(image)
			image.heightAnchor.constraint(equalToConstant: 200).isActive = true
		 }else{
			let label = createLaber(text: "Text#\(i)")
			stack.addArrangedSubview(label)
			label.translatesAutoresizingMaskIntoConstraints = false
			label.textAlignment = .center
		 }
	  }
	  
	  
	  NSLayoutConstraint.activate([
		scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
		scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
		scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
		scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
		
		stack.topAnchor.constraint(equalTo: scrollView.topAnchor),
		stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
		stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
		stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
		stack.widthAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.widthAnchor, constant: -40)
	  ])
	  
	}


}

extension ViewController: UIScrollViewDelegate{
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
  }
}


func createLaber(text: String) -> UILabel{
  let label = UILabel()
  label.text = text
  label.font = UIFont.preferredFont(forTextStyle: .title2)
  label.textColor = .black
  return label
}


func createImage() -> UIImageView{
  let image = UIImageView()
  
  image.contentMode = .scaleAspectFit
  image.image = UIImage(named: "plant")
  return image
}
