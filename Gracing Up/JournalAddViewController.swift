//
//  JournalAddViewController.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 8/23/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class JournalAddViewController: UIViewController {
    
    @IBOutlet weak var entryTextView: UITextView!
    
    @IBAction func addNewEntry(sender: AnyObject) {
        let entry = entryTextView!.text!
        
        let currentDate = NSDate()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("JournalEntry", inManagedObjectContext:managedContext)
        
        let theEntry = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        theEntry.setValue(entry, forKey: "contents")
        theEntry.setValue(currentDate, forKey: "datePublished")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        self.performSegueWithIdentifier("backToJournal", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}