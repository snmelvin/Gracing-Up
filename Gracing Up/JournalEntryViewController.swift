//
//  JournalEntryViewController.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 8/22/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class JournalEntryViewController: UIViewController {
    
    var entry : NSManagedObject?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let displayDate = entry!.valueForKey("datePublished")! as! NSDate
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        
        let stringDate = dateFormatter.stringFromDate(displayDate)
        
        self.dateLabel.text = stringDate
        
        self.textLabel.text = entry!.valueForKey("Contents") as? String
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}