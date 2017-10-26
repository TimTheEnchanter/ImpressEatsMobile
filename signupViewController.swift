//
//  ViewController.swift
//  Impress Eats
//
//  Created by Chris on 2017-06-30.
//  Copyright © 2017 Division 1 Media Corp. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration


class signupViewController: UIViewController, UIWebViewDelegate {
    
    
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if ConnectionCheck.isConnectedToNetwork() {
            
            NSLog("Internet connection OK")
            // Do any additional setup after loading the view, typically from a nib.
            //let url = URL(string: "https://www.impresseats.com")
            
            // webView.delegate = self
            if let url = URL(string: "https://www.impresseats.com/Signup") {
                let request = URLRequest(url: url)
                webView.loadRequest(request)
            }
            
        } else {
            
            createAlert(title: "Error", message: "No internet connection.")
            
        }
        
        
        
    }
    
    func webViewDidStartLoad(_ : UIWebView){
        activity.startAnimating();
        NSLog("Webview is loading.")
    }
    
    func webViewDidFinishLoad(_ : UIWebView){
        activity.stopAnimating();
        NSLog("Webview stopped loading.")
    }
    
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //CREATING ON BUTTON
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print ("Okay")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

