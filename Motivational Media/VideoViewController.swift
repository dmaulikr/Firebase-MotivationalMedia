//
//  VideoViewController.swift
//  Motivational Media
//
//  Created by Komran Ghahremani on 12/24/14.
//  Copyright (c) 2014 Komreezy. All rights reserved.
//

import UIKit

/*
 * Display an image button that will preview the video and then
 * when clicked it will open up a modal web view
 */

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
