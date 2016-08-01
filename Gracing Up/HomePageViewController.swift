//
//  HomePageViewController.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 6/18/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import UIKit
import CoreData

class HomePageViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (NSUserDefaults.standardUserDefaults().objectForKey("installDate") == nil) {
            // case: installDate key has not been created
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(NSDate(), forKey: "installDate")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

