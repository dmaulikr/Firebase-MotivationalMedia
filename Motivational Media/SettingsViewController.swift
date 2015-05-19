//
//  SettingsViewController.swift
//  Motivational Media
//
//  Created by Komran Ghahremani on 12/24/14.
//  Copyright (c) 2014 Komreezy. All rights reserved.
//
//  1. Notifications switch
//  2. Date/Time Picker to set Quote of the Day notification -- maybe modal
//  3. Button to set the time
//  4. Maybe a table view to set multiple alarms
//


import UIKit

class SettingsViewController: UIViewController {
    
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
