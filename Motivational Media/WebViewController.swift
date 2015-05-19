//
//  WebViewController.swift
//  Motivational Media
//
//  Created by Komran Ghahremani on 1/8/15.
//  Copyright (c) 2015 Komreezy. All rights reserved.
//

import UIKit

let url = NSURL(string: "https://www.youtube.com/watch?v=UF8uR6Z6KLc") //url of video web page

class WebViewController: UIViewController {
    
    @IBOutlet var myWebView: UIWebView! //web view reference
    @IBOutlet var closeButton: UIButton!
    
    let requestObj = NSURLRequest(URL:url!) // make web page a request
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.closeButton.tintColor = UIColorFromHex(0xFF3030, alpha: 1.0)
        myWebView.loadRequest(requestObj) //load the request in the web view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeModal(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil) // close button to close the modal view controller holding the web page
    }
    
    //Set the text color of the nav bar
    //Add the logo to the middle
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        var nav = self.navigationController?.navigationBar //instantiate your nav bar into a variable
        
        nav?.tintColor = UIColor.whiteColor() //color of the text to white
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40)) // make image view where logo is going
        imageView.contentMode = .ScaleAspectFit //fit image to view with keeping aspect ratio
        
        let image = UIImage(named: "logo")
        imageView.image = image //set image logo into just created imageview
        
        navigationItem.titleView = imageView //add the image view with the logo to the title view of the nav
    }

}
