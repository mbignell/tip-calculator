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
    
    var tipStepperPercent = 0.15
    var numberPeopleCount = 1.0
    
     var billAmount = 0.0
    var tip = 0.0
    var total = 0.0
     var tipAmountValue = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        totalLabel.text = "$0.00"
        tipStepperLabel.text = "18%"
        tipAmount.text = "+ $0.00"
        numberPeopleLabel.text = "Just Me"
        finalBillLabel.text = "Your Total"
        billField.becomeFirstResponder()
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
    
    
    
}
