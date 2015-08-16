//
//  MySecondViewController.swift
//  lalala
//
//  Created by Margaret Bignell on 8/12/15.
//  Copyright (c) 2015 maggled. All rights reserved.
//

import UIKit

class MySecondViewController: UIViewController {
  
    var userDefaults : NSUserDefaults?
    let numbers = [ 13, 15, 16, 7]
    var defaultNumber : Int?
    
    @IBOutlet weak var currencyControl: UISegmentedControl!
    
    @IBOutlet weak var tipDefaultStepper: UIStepper!
    @IBOutlet weak var currencyFeedback: UILabel!
    @IBOutlet weak var tipDefaultFeedback: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var tipDefaultChoiceLabel: UILabel!
    
    
    var currencyChoice="$"
    var tipDefaultChoice = 0.18
    var tipStepperPercent = 0.18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        userDefaults = NSUserDefaults.standardUserDefaults()
        let numberVal = userDefaults?.integerForKey("defaultNumber")
     //   tipDefaultControl.selectedSegmentIndex = 0
      //  for (index,tmp) in enumerate(numbers) {
       //     if(numberVal == tmp){
        //        tipDefaultControl.selectedSegmentIndex = index
         //   }
       // }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCurrencyChange(sender: AnyObject) {
        var currencyChoices = ["$", "£", "⭐︎"]
        currencyChoice = currencyChoices[currencyControl.selectedSegmentIndex]
        currencyFeedback.text = "Currency would now theoretically be \(currencyChoice)"
        saveButton.backgroundColor = UIColor(red: 0.9, green: 0.4, blue: 0.0, alpha: 0.9)
        saveButton.setTitle("Save", forState: UIControlState.Normal)
    }
    
    @IBAction func onTipDefaultChange2(sender: UIStepper) {
        tipDefaultChoice = sender.value
        tipDefaultChoiceLabel.text = "\(Int(sender.value).description)%"
        tipStepperPercent = sender.value/100
        tipDefaultFeedback.text = "Tip default would now be \(tipDefaultChoice)"
        saveButton.backgroundColor = UIColor(red: 0.9, green: 0.4, blue: 0.0, alpha: 0.9)
        saveButton.setTitle("Save", forState: UIControlState.Normal)
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
