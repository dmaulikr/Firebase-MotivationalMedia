//
//  ViewController.swift
//  Motivational Media
//
//  Created by Komran Ghahremani on 12/23/14.
//  Copyright (c) 2014 Komreezy. All rights reserved.
//

import UIKit

//some color extensions that allow us to use hexadecimals more easily in our code
extension UIColor {
    
    convenience init(hex: Int) {
        
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
        
    }
    
}
extension CGColor {
    
    class func colorWithHex(hex: Int) -> CGColorRef {
        
        return UIColor(hex: hex).CGColor
        
    }
    
}

class ViewController: UIViewController {

    //hold the question marks
    @IBOutlet var imageViewLeft: UIImageView!
    @IBOutlet var imageViewRight: UIImageView!
    
    @IBOutlet var overlayImageView: UIImageView!
    
    @IBOutlet var textView: UITextView! //text view for the quote to be displayed in
    
    //images of quotation marks
    var imageQuoteLeft = UIImage(named: "leftquote")
    var imageQuoteRight = UIImage(named: "rightquote")
    
    //correct url to grab the quote (for me)
    var ref = Firebase(url:"https://sweltering-torch-9301.firebaseio.com/quotes/quote/text")
    
    var quoteString: String! //to hold the quote when we get it
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Set the color of the nav bar
    //Add the logo to the middle
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        var nav = self.navigationController?.navigationBar //instantiate your nav bar into a variable
        
        nav?.tintColor = UIColor.whiteColor() //color of the text to white
        
        // make image view where logo is going
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit //fit image to view with keeping aspect ratio

        let image = UIImage(named: "logo")
        imageView.image = image //set image logo into just created imageview

        navigationItem.titleView = imageView //add the image view with the logo to the title view of the nav
        
    }


    @IBAction func getQuote(sender: UIButton){
            // get the quote of the day
            // attach a closure to read the data at our posts reference
            // var quotesRef = ref.childByAppendingPath("quotes")
        
            self.overlayImageView.alpha  = 0.0 //disappear image view
        
            ref.observeEventType(.Value, withBlock: { snapshot in
                //display text on the label
                println(snapshot.value)
                
                self.quoteString = snapshot.value as? String //get string at the firebase url from above
                self.textView.text = self.quoteString //set the text view text as what we got to display it
                
            }, withCancelBlock: { error in
                println(error.description)
        })
    }

    // method to test writing to the Firebase - should clear ending "/" in url above
    // Firebase(url:"https://sweltering-torch-9301.firebaseio.com/")
    @IBAction func writeToFirebase(sender: UIButton){
        
        //quote we want in a "text" key
        var dailyQuote = ["text": "Ability is what you're capable of doing. Motivation determines what you do. Attitude determines how well you do it. - Lou Holtz"]
        
        //quotes path to url so now path is: https://sweltering-torch-9301.firebaseio.com/quotes
        var usersRef = ref.childByAppendingPath("quotes")
        
        //wrap the quote in a "quote" key so now the url is: 
        //https://sweltering-torch-9301.firebaseio.com/quotes/quote/text
        var users = ["quote": dailyQuote]
        usersRef.setValue(users) //load to the url in the firebase
        
    }
    
}

