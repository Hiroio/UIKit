//
//  DetailViewController.swift
//  StormViewer(UIKit)
//
//  Created by user on 23.04.2026.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet var imageView: UIImageView!
  var selectedImage: String?
  var total: Int?
  var current: Int?
  
    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Picture: \((current ?? 0) + 1)/\(total ?? 0)"
		navigationItem.largeTitleDisplayMode = .never
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
		
		if let selectedImage{
		  imageView.image = UIImage(named: selectedImage)
		}
    }
  
  
  override func viewWillAppear(_ animated: Bool) {
	 super.viewWillAppear(animated)
	 
	 navigationController?.hidesBarsOnTap = true
  }
    
  override func viewWillDisappear(_ animated: Bool) {
	 super.viewWillDisappear(animated)
	 
	 navigationController?.hidesBarsOnTap = false
  }

  @objc func shareTapped(){
	 guard let image = imageView.image?.jpegData(compressionQuality: 0.8), let selectedImage else {return}
	 let vc = UIActivityViewController(activityItems: [image, selectedImage], applicationActivities: [])
	 vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
	 present(vc, animated: true)
  }

}
