//
//  DetailViewController.swift
//  ShareFlag(UIKIT)
//
//  Created by user on 24.04.2026.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet var imageView: UIImageView!
  var selectedCountry: String?
  var current: Int?
  var total: Int?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedCountry ?? "Unknown"
		navigationItem.largeTitleDisplayMode = .never
		
		if let selectedCountry{
		  imageView.image = UIImage(named: selectedCountry)
		  
		  imageView.layer.cornerRadius = 30
		  imageView.layer.borderWidth = 1
		}

		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
    }
    

  @objc func shareImage(){
	 guard let selectedCountry, let image = UIImage(named: selectedCountry)?.jpegData(compressionQuality: 0.8) else {return}
	 let ac = UIActivityViewController(activityItems: [image], applicationActivities: [])
	 
	 present(ac, animated: true)
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
