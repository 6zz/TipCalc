//
//  ViewController.swift
//  Tipper
//
//  Created by Shawn Zhu on 8/21/15.
//  Copyright (c) 2015 Shawn Zhu. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    let DEFAULT_TIPS_INDEX = "tipsSegmentedControlIndex"
    let KEY_BILL_AMOUNT = "billAmount"
    let KEY_LAST_VISIT = "lastVisit"

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var index = defaults.integerForKey(DEFAULT_TIPS_INDEX)
        var billText = defaults.objectForKey(KEY_BILL_AMOUNT) as? String

        tipControl.selectedSegmentIndex = index
        
        if billText != nil {
            billField.text = billText
            onEditingChanged(billField)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercents = [0.18, 0.2, 0.22]
        var billAmount = NSString(string: billField.text).doubleValue
        var tipPercent = tipPercents[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercent
        var total = billAmount + tip
        var formatter = NSNumberFormatter();
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(NSDate(), forKey: KEY_LAST_VISIT)

        if sender as! NSObject == billField {
            defaults.setObject(billField.text, forKey: KEY_BILL_AMOUNT)
        }

        formatter.numberStyle = .CurrencyStyle
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

