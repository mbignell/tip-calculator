//
//  ViewController.swift
//  lalala
//
//  Created by Margaret Bignell on 4/24/15.
//  Copyright (c) 2015 maggled. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipStepperControl: UIStepper!
    @IBOutlet weak var tipStepperLabel: UILabel!
    @IBOutlet weak var numberPeopleControl: UIStepper!
    @IBOutlet weak var numberPeopleLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var finalBillLabel: UILabel!
    @IBOutlet weak var settingsIcon: UIButton!
    
    
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var splitView: UIView!
    @IBOutlet weak var finalShare: UIView!
    
    
    var tipStepperPercent = 0.15
    var numberPeopleCount = 1.0
    
     var billAmount = 0.0
    var tip = 0.0
    var total = 0.0
     var tipAmountValue = 0.0
    
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        totalLabel.text = "$0.00"
        tipStepperLabel.text = "18%"
        tipAmount.text = "+ $0.00"
        numberPeopleLabel.text = "Just Me"
        finalBillLabel.text = "Your Total"
        billField.becomeFirstResponder()
        
        tipView.center.x  -= view.bounds.width
        splitView.center.x -= view.bounds.width
        finalShare.center.x -= view.bounds.width

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runCalculations() {
        tip = billAmount * tipStepperPercent
        total = (billAmount + tip) / numberPeopleCount
        tipAmountValue = tipStepperPercent * billAmount
        
        tipAmount.text = String(format: "+ $%.2f", tipAmountValue)
        
        totalLabel.text = "$\(total)"
        
        totalLabel.text = String(format: "$%.2f", total)
        
        if numberPeopleCount > 1 {
            finalBillLabel.text = "\(Int(numberPeopleCount)) shares of"
        } else {
            finalBillLabel.text = "Your Total"
        }

    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        if count == 0 {
            UIView.animateWithDuration(0.8, animations: {
                self.tipView.center.x += self.view.bounds.width
            })
            UIView.animateWithDuration(0.9, animations: {
                self.splitView.center.x += self.view.bounds.width
            })
            UIView.animateWithDuration(1.0, animations: {
                self.finalShare.center.x += self.view.bounds.width
            })
        }
        
        count = 1
        
        billAmount = NSString(string:billField.text).doubleValue
        
        runCalculations()
    }
    
    @IBAction func tipStepperChange(sender: UIStepper) {
        tipStepperLabel.text = "\(Int(sender.value).description)%"
        tipStepperPercent = sender.value/100
        runCalculations()

    }
    @IBAction func numberPeopleChange(sender: UIStepper) {
        numberPeopleLabel.text = "\(Int(sender.value).description) ways"
        numberPeopleCount = sender.value
        if sender.value == 1 {
            numberPeopleLabel.text = "Just Me"
        }
        runCalculations()
    }
    
    @IBAction func openSettings(sender: AnyObject) {
        println("openingsettings!")
        
    }
    
    
}
