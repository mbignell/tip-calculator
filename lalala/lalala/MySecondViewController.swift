//
//  MySecondViewController.swift
//  lalala
//
//  Created by Margaret Bignell on 8/12/15.
//  Copyright (c) 2015 maggled. All rights reserved.
//

import UIKit

class MySecondViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DoneAction(send: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func clickButton(sender: AnyObject) {
        println("clicked")
        if let url = NSURL(string: "http://static4.businessinsider.com/image/5049fdefecad04a361000008/throwing-money.gif") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
}
