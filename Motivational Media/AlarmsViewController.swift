//
//  AlarmsViewController.swift
//  Motivational Media
//
//  Created by Komran Ghahremani on 2/5/15.
//  Copyright (c) 2015 Komreezy. All rights reserved.
//

import UIKit

//lets us use hexadecimals
func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    
    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
}

class AlarmsViewController: UIViewController {

    @IBOutlet var notifSwitch: UISwitch!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var setTimeButton: UIButton!
    @IBOutlet var closeButton: UIButton!
    var notificationDate: NSDate!
    var notification: UILocalNotification!
    
    var ref = Firebase(url:"https://sweltering-torch-9301.firebaseio.com/quotes/quote/text")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTimeButton.tintColor = UIColorFromHex(0xFF3030, alpha: 1.0)
        self.closeButton.tintColor = UIColorFromHex(0xFF3030, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //set notification time with the message
    @IBAction func setTime(sender: UIButton){
        
        let notification = UILocalNotification()
        
        /* Time and timezone settings */
        
        notification.fireDate = self.datePicker.date
        notification.timeZone = NSCalendar.currentCalendar().timeZone
        
        notification.alertBody = "Make the most of today"
        
        /* Action settings */
        notification.hasAction = true
        notification.alertAction = "View"
        
        /* Badge settings */
        notification.applicationIconBadgeNumber--
        
        /* Additional information, user info */
        notification.userInfo = [
            "Key 1" : "Value 1",
            "Key 2" : "Value 2"
        ]
        
        /* Schedule the notification */
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        //Display an alert view to let the user know that their alarm was set
        let alertController = UIAlertController(title: "Success!", message: "Your alarm has been set for \(notification.fireDate)", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
    
    //close the modal view controller
    @IBAction func closeModal(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
