//
//  MySecondViewController.swift
//  lalala
//
//  Created by Margaret Bignell on 8/12/15.
//  Copyright (c) 2015 maggled. All rights reserved.
//

import UIKit

class MySecondViewController: UIViewController {

    @IBOutlet weak var currencyControl: UISegmentedControl!
    @IBOutlet weak var tipDefaultControl: UISegmentedControl!
    
    @IBOutlet weak var currencyFeedback: UILabel!
    @IBOutlet weak var tipDefaultFeedback: UILabel!
    
    var currencyChoice="$"
    var tipDefaultChoice = 0.18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCurrencyChange(sender: AnyObject) {
       var currencyChoices = ["$", "£", "⭐︎"]
        currencyChoice = currencyChoices[currencyControl.selectedSegmentIndex]
       currencyFeedback.text = "Currency would now theoretically be \(currencyChoice)"
    }
    
    @IBAction func onTipDefaultChange(sender: AnyObject) {
        var tipDefaultChoices = [0.12, 0.15, 0.18,0.20]
        tipDefaultChoice = tipDefaultChoices[tipDefaultControl.selectedSegmentIndex]
        tipDefaultFeedback.text = "Tip default would now be \(tipDefaultChoice)"
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
