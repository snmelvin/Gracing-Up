//
//  CivilityGoalViewController.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 6/18/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation
import UIKit


class CivilityGoalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func determineTime(start: NSDate) -> String{
        let now = NSDate()
        var dates = [NSDate]()
        for i in 0...51{
            let newDate = start.dateByAddingTimeInterval(60*60*24*(Double(i) * 7.0))
            dates.append(newDate)
        }
        for i in 1...51{
            let result = dates[i].earlierDate(now)
            if(result == now){
                return String(i - 1)
            }
        }
        return String(51)
    }
    
}