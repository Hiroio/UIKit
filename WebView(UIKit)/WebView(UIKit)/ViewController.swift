//
//  ViewController.swift
//  WebView(UIKit)
//
//  Created by user on 24.04.2026.
//

import UIKit
import WebKit

class ViewController: UIViewController {
  var webView: WKWebView!
  
  override func loadView() {
	 webView = WKWebView()
	 webView.navigationDelegate = self
	 view = webView
  }
  
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

