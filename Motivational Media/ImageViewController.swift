//
//  ImageViewController.swift
//  Motivational Media
//
//  Created by Komran Ghahremani on 12/24/14.
//  Copyright (c) 2014 Komreezy. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var overlayImageView: UIImageView!
    
    //the URL to my firebase - use this variable for reference to it
    //this particular URL maps to the base 64 strings for our image because that's how you have to store them
    var ref = Firebase(url:"https://sweltering-torch-9301.firebaseio.com/images/image/string")
    
    var base64String: NSString! //this will hold the string in base64 of our image when we need it
    //var decodedData: NSData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getImage(sender: UIButton){
        
        self.overlayImageView.alpha = 0.0 // disappear the overlay image
        
        //Get the base64 string, convert, and put up the image in the image view
        ref.observeEventType(.Value, withBlock: { snapshot in
            //display text on the label
            //println(snapshot.value) //testing
            
            self.base64String = snapshot.value as! String //get the string loaded at the URL reference
            var decodedData = NSData(base64EncodedString: snapshot.value as! String, options: NSDataBase64DecodingOptions()) //decode the base 64 string into image data
            var decodedImage = UIImage(data: decodedData!)! //use that data to make an actual image
            self.imageView.image = decodedImage //set the image to our image view in the storyboard
            
            // println(self.base64String) //print out for testing (very long though)
            
            }, withCancelBlock: { error in
                println(error.description)
        })

    }
    
    
    //method to test writing to the Firebase -- make sure URL is the original URL no "/" at the end
    // Firebase(url:"https://sweltering-torch-9301.firebaseio.com/")
    @IBAction func writeToFirebase(sender: UIButton){
        
        //make a new UIImage
        var uploadImage = UIImage(named: "snoop")
        
        //make an NSData JPEG representation of the image
        var imageData: NSData = UIImagePNGRepresentation(uploadImage)
        
        // using base64StringFromData method, we are able to convert data to string
        self.base64String = imageData.base64EncodedStringWithOptions(.allZeros)
        
        var quoteString = ["string": self.base64String] //give the string a key
        
        var usersRef = ref.childByAppendingPath("images") //go to right place in hierarchy - may be different for you
        
        var users = ["image": quoteString] //tucks in the "string" key from earlier into an "image" key
        usersRef.setValue(users) //that gets tucked into the "images" part of the hierarchy we made with usersRef
        
    }

}
