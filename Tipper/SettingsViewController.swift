//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Shawn Zhu on 8/22/15.
//  Copyright (c) 2015 Shawn Zhu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let DEFAULT_TIPS_INDEX = "tipsSegmentedControlIndex"
    @IBOutlet weak var tipsSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        var index = defaults.integerForKey(DEFAULT_TIPS_INDEX)
        tipsSegmentedControl.selectedSegmentIndex = index
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // refresh the tip page with the new default percentage
        var index = tipsSegmentedControl.selectedSegmentIndex;
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(index, forKey: DEFAULT_TIPS_INDEX)
        defaults.synchronize()
    }


}
