//
//  EntryAddViewController.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 8/22/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EntryAddViewController: UIViewController {
    
    @IBOutlet weak var entryText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //textView.text = "Type Entry Here"
//        save.addTarget(self, action: "addEntry:", forControlEvents: UIControlEvents.TouchUpInside)
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func addJournal(sender: AnyObject) {
//        print("got to addJournal")
//    }
    
//    @IBAction func addEntry(sender: AnyObject!) {
//        let entry = entryText!.text!
//        
//        let currentDate = NSDate()
//        
//        let appDelegate =
//            UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        let entity =  NSEntityDescription.entityForName("JournalEntry",
//                                                        inManagedObjectContext:managedContext)
//        
//        let theEntry = NSManagedObject(entity: entity!,
//                                       insertIntoManagedObjectContext: managedContext)
//        
//        theEntry.setValue(entry, forKey: "contents")
//        theEntry.setValue(currentDate, forKey: "datePublished")
//        
//        do {
//            try managedContext.save()
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//        //self.saveEntry(entryText!.text!)
//    }
    
//    func saveEntry(entry: String) {
//        let currentDate = NSDate()
//        
//        let appDelegate =
//            UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        let entity =  NSEntityDescription.entityForName("JournalEntry",
//                                                        inManagedObjectContext:managedContext)
//        
//        let theEntry = NSManagedObject(entity: entity!,
//                                       insertIntoManagedObjectContext: managedContext)
//        
//        theEntry.setValue(entry, forKey: "contents")
//        theEntry.setValue(currentDate, forKey: "datePublished")
//        
//        do {
//            try managedContext.save()
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//    }
    
    
    
}