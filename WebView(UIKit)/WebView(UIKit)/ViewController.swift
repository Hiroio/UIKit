//
//  ViewController.swift
//  WebView(UIKit)
//
//  Created by user on 24.04.2026.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
  var webView: WKWebView!
  var currentPage: String!
  var websites = ["google.com", "apple.com", "hackingwithswift.com"]
  var progressView: UIProgressView!
  var backButton: UIBarButtonItem!
  var forwardButton: UIBarButtonItem!
  
  override func loadView() {
	 webView = WKWebView()
	 webView.navigationDelegate = self
	 view = webView
	 backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: webView, action: #selector(webView.goBack))
	 forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: webView, action: #selector(webView.goForward))
  }
  
	override func viewDidLoad() {
		super.viewDidLoad()
		
	  navigationItem.rightBarButtonItem = UIBarButtonItem(title: "open", style: .plain, target: self, action: #selector(openTapped))
	  
	  let url = URL(string: "https://" + currentPage)!
	  
	  webView.load(URLRequest(url: url))
	  webView.allowsBackForwardNavigationGestures = true
	  
	  let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
	  let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
	  progressView = UIProgressView(progressViewStyle: .bar)
	  progressView.sizeToFit()
	  webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
	  
	  
	  let progressButton = UIBarButtonItem(customView: progressView)
	  toolbarItems = [backButton, forwardButton, spacer, progressButton, spacer, refresh]
	  
	  navigationController?.isToolbarHidden = false
	}


  @objc func openTapped(){
	 let ac = UIAlertController(title: "Open page", message: nil, preferredStyle: .actionSheet)
	 
	 for website in websites {
		ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
	 }
	 ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
	 
	 ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
	 
	 present(ac, animated: true)
  }
  
  func openPage(action: UIAlertAction){
	 let url = URL(string: "https://" + action.title!)!
	 
	 webView.load(URLRequest(url: url))
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
	 title = webView.title
	 forwardButton.isEnabled = webView.canGoForward
	 backButton.isEnabled = webView.canGoBack
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
	 if keyPath == "estimatedProgress"{
		progressView.progress = Float(webView.estimatedProgress)
	 }
  }
  
  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
	 let url = navigationAction.request.url
	 
	 if let host = url?.host(){
		for website in websites {
		  if host.contains(website){
			 return .allow
		  }
		}
	 }
	 
	 let ac = UIAlertController(title: "Error!", message: "This page is not allowed", preferredStyle: .alert)
	 
	 ac.addAction(UIAlertAction(title: "Continue", style: .default))
	 
	 present(ac, animated: true)
	 return .cancel
  }
  

}

