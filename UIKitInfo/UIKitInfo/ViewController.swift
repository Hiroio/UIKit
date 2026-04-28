//
//  ViewController.swift
//  UIKitInfo
//
//  Created by user on 28.04.2026.
//

import UIKit

class ViewController: UIViewController {
  
//  If you need to create single element, make it closure
//  If you need constructor element (multiple labels) -> make it function (looks like View Modifier)
//  Element on different ViewControllers make custom class
  
//  MARK: ELEMENTS
  lazy var pageTitle: UILabel = {
	 $0.text = "Root View"
	 $0.font = .preferredFont(forTextStyle: .title1)
	 $0.textColor = .white
	 $0.textAlignment = .center
	 $0.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 55)
	 return $0
  }(UILabel())
  
  lazy var secondTitle: UILabel = createLabel(text: "Second Label", frame: CGRect(x: 20, y: pageImage.frame.maxY + 10, width: view.frame.width - 40, height: 55))
  
  lazy var pageImage: UIImageView = {
	 $0.image = .image
	 $0.frame = CGRect(x: 20, y: pageTitle.frame.maxY + 20, width: view.frame.width - 40, height: 200)
	 $0.contentMode = .scaleAspectFit
	 return $0
  }(UIImageView())
  
  lazy var button: UIButton = {
	 $0.setTitle("Click me", for: .normal)
	 $0.setTitleColor(.white, for: .normal)
	 $0.backgroundColor = .green
	 $0.layer.cornerRadius = 20
	 $0.frame.size = CGSize(width: view.frame.width - 40, height: 55)
	 $0.frame.origin = CGPoint(x: 20, y: view.frame.maxY - 75)
	 
	 $0.addAction(UIAction{ [weak self] _ in
		  print("Button Clicked")
		
		guard let self = self else {return}
		self.pageTitle.text = "Clicked Button"
		
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1){
		  self.pageTitle.text = "Root Title"
		}
	 }, for: .touchUpInside)
	 return $0
  }(UIButton())
  
  lazy var circle: UIView = {
	 $0.backgroundColor = .cyan
	 $0.frame.size = CGSize(width: 200, height: 200)
	 $0.center.x = view.frame.midX
	 $0.frame.origin.y = secondTitle.frame.maxY + 30
	 $0.layer.cornerRadius = 100
	 
	 return $0
  }(UIView())
  
  lazy var circleLabel: UILabel = createLabel(text: "Circle", frame: CGRect(x: 10, y: circle.frame.width / 2 - 10, width: circle.frame.width - 20, height: 20))
  
//  MARK: -
  
  // MARK: Life Cycle
  
  override func loadView() {
	 super.loadView()
	 print("Loading View...")
  }
  
  
  override func viewDidLoad() {
	 super.viewDidLoad()
	 // Do any additional setup after loading the view.
	 
	 view.backgroundColor = .lightGray
	 view.addSubview(pageTitle)
	 view.addSubview(pageImage)
	 view.addSubview(secondTitle)
	 view.addSubview(button)

	 view.addSubview(circle)
	 circle.addSubview(circleLabel)
	 
	 
	 NSLayoutConstraint.activate([
		
	 ])
  }
  
  override func viewWillAppear(_ animated: Bool) {
	 print("View Appear")
  }
  
  override func viewDidAppear(_ animated: Bool) {
	 print("View displayed")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
	 print("View disappearing")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
	 print("View disappear")
  }
  
  
//  Additional
  
  override func viewWillLayoutSubviews() {
	 print("Landscape || Portrait")
  }
  
  override func viewDidLayoutSubviews() {
	 print("Landscape || Portrait")
  }
  
  
  
  
//  FOR UI
  func createLabel(text: String, frame: CGRect) -> UILabel{
	 let label = UILabel()
	 label.text = text
	 label.textColor = .red
	 label.frame = frame
	 label.font = .preferredFont(forTextStyle: .headline)
	 label.textAlignment = .center
	 return label
  }
}



class someLabel: UILabel{
  
  var title: String = "" {
	 didSet{
		setUpLabel()
	 }
  }
  
  override init(frame: CGRect) {
	 super.init(frame: frame)
	 setUpLabel()
  }
  
  required init?(coder: NSCoder) {
	 super.init(coder: coder)
	 setUpLabel()
  }
  
  private func setUpText() {
	 self.text = self.title
  }
  
  private func setUpLabel(){
	 self.font = .preferredFont(forTextStyle: .title3)
	 self.textColor = .cyan
	 self.textAlignment = .center
  }
}
