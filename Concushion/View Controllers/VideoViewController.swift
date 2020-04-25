//
//  contactCell.swift
//  maps0.1
//
//  Created by Caleb Foglio on 2/4/20.
//  Copyright © 2020 Prateek Bhatt. All rights reserved.
//

import Foundation
import UIKit
import WebKit


class VideoViewController: UIViewController, WKUIDelegate {
    
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var backButton: UIBarButtonItem!
    @IBOutlet var forwardButton: UIBarButtonItem!
    @IBOutlet var refreshButton: UIBarButtonItem!
    @IBOutlet var toolBar: UIToolbar!
    @IBOutlet var progView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.uiDelegate = self
        let myURL = URL(string:"http://13.59.245.151:3030")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
        // Visuals
        toolBar.backgroundColor?.withAlphaComponent(0.3)
        
        // Observer for loading bar
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        progView.setProgress(Float(webView.estimatedProgress), animated: true)
        
        //webView.addObserver(self, forKeyPath: #keyPath(WKWebView.url.isFileURL), options: .new, context: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(videoPlayedInWebView), name: NSNotification.Name(rawValue: "AVPlayerItemBecameCurrentNotification"), object: nil)
        
    }
    
//    @objc func videoPlayedInWebView(aNotification: NSNotification) {
//       if let playerItem: AVPlayerItem = aNotification.object as? AVPlayerItem{
//           let asset: AVURLAsset = playerItem.asset as! AVURLAsset
//           var downloadebaleVideoUrl = asset.url
//           print(downloadebaleVideoUrl)
//    }
 
    @IBAction func backButtonPressed(_ sender: Any) {
        if (webView.canGoBack){
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonPushed(_ sender: Any) {
        if (webView.canGoForward){
            webView.goForward()
        }
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        
        webView.reload()
    }
    
    // Progress Bar
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if (webView.isLoading){
            if webView.estimatedProgress == 1.0 {
                progView.isHidden = true
            }
            else if keyPath == "estimatedProgress" {
                progView.isHidden = false
                progView.progress = Float(webView.estimatedProgress)
            }
        }
        else{
            progView.isHidden = true
        }
        
    }
    
    // Video downloading
//    override func observe<Value>(_ keyPath: KeyPath<VideoViewController, Value>, options: NSKeyValueObservingOptions = [], changeHandler: @escaping (VideoViewController, NSKeyValueObservedChange<Value>) -> Void) -> NSKeyValueObservation {
//        <#code#>
//    }
    
}
