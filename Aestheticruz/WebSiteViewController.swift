//
//  WebSiteViewController.swift
//  Aestheticruz
//
//  Created by Roberto Pando on 2/15/16.
//  Copyright © 2016 Aestheticruz. All rights reserved.
//

import UIKit
import WebKit

class WebSiteViewController: UIViewController{
    
    
    @IBOutlet weak var acWebview: UIWebView!
    @IBOutlet weak var activityPage: UIActivityIndicatorView!
    
    func getThePage() {
        let theURL = NSURL(string: "http://aestheticruz.com/")
        let theRequestURL = NSURLRequest(URL: theURL!)
        acWebview.loadRequest(theRequestURL)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getThePage()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ : UIWebView) {
        activityPage.startAnimating()
    }
    func webViewDidFinishLoad(_ : UIWebView) {
        activityPage.stopAnimating()
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
