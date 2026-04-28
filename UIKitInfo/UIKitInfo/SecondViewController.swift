//
//  SecondViewController.swift
//  UIKitInfo
//
//  Created by user on 28.04.2026.
//

import UIKit

class SecondViewController: UIViewController {
  lazy var pageText: UILabel = createLabel(text: "Roman emperor from 161 to 180 and a Stoic philosopher. He was a member of the Nerva–Antonine dynasty, the last of the rulers later known as the Five Good!", font: .headline)
  lazy var secondTitle: UILabel = createLabel(text: "Second Label", font: .headline)
  lazy var topImage: UIImageView = createImageView(image: .photo1)
  lazy var bottomImage: UIImageView = createImageView(image: .photo2)
  
  lazy var btn: UIButton = {
	 $0.setTitle("Continue", for: .normal)
	 $0.setTitleColor(.white, for: .normal)
	 $0.backgroundColor = .systemMint
	 $0.layer.cornerRadius = 10
	 $0.translatesAutoresizingMaskIntoConstraints = false
	 return $0
  }(UIButton(primaryAction: btnAction))
  
  lazy var btnAction: UIAction = UIAction { _ in
	 print("Btn Pressed")
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = .white
		
		let stack = UIStackView(arrangedSubviews: [bottomImage, secondTitle])
		stack.axis = .vertical
		stack.spacing = 20
		stack.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(topImage)
		view.addSubview(pageText)
		view.addSubview(stack)
//		view.addSubview(bottomImage)
//		view.addSubview(secondTitle)
		view.addSubview(btn)
		
		NSLayoutConstraint.activate([
		  topImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
		  topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
		  topImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
		  topImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
		  
		  pageText.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 20),
		  pageText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
		  pageText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
		  
		  bottomImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
		  
		  stack.topAnchor.constraint(equalTo: pageText.bottomAnchor, constant: 20),
		  stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
		  stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
		  
		  btn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
		  btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
		  btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
		  btn.heightAnchor.constraint(equalToConstant: 55)
		])
		
		
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

  
  func createLabel(text: String, font: UIFont.TextStyle) -> UILabel{
	 let label = UILabel()
	 label.text = text
	 label.font = .preferredFont(forTextStyle: font)
	 label.translatesAutoresizingMaskIntoConstraints = false
	 label.numberOfLines = 0
	 return label
  }
  
  func createImageView(image: UIImage) -> UIImageView{
	 let newImage = UIImageView()
	 newImage.image = image
	 newImage.translatesAutoresizingMaskIntoConstraints = false
	 newImage.layer.cornerRadius = 20
	 newImage.contentMode = .scaleAspectFill
	 newImage.clipsToBounds = true
	 
	 
	 return newImage
  }
}
