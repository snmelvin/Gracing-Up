//
//  InspirationQuoteViewController.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 6/18/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation
import UIKit

class InspirationQuoteViewController: UIViewController {
    
    @IBOutlet weak var quoteText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getGoal()
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
    
    func getGoal() {
        // get the installDate from nsuserdefaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let origDate = defaults.objectForKey("installDate") as! NSDate
        let weekString = determineTime(origDate)
        let weekInt :Int? = Int(weekString)
        
        // read the civility goals file
        let location = "/Users/sarah/Desktop/Gracing-Up/Gracing Up/wireframes + timeline/inspiration-quotes.txt"
        let fileContent = try? NSString(contentsOfFile: location, encoding: NSUTF8StringEncoding) as String
        
        // put content of file into an array
        let newlineChars = NSCharacterSet.newlineCharacterSet()
        let lines = fileContent!.utf16.split { newlineChars.characterIsMember($0) }.flatMap(String.init)
        
        // get goal from array
        let goal = lines[weekInt!]
        self.quoteText.text = goal
        
    }

    
}