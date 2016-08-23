//
//  JournalViewController.swift
//  Gracing Up
//
//  Created by Jake Shor on 6/20/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class JournalViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var journalTableView: UITableView!
    var entries = [NSManagedObject]()
//    @IBOutlet weak var newJournal: UIButton!
    var entry = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "\"The List\""
        journalTableView.registerClass(UITableViewCell.self,
                                forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "JournalEntry")
        
        //3
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            entries = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
        
        let entry = entries[indexPath.row]
        
        
        let displayDate = entry.valueForKey("datePublished")! as! NSDate
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        
        let stringDate = dateFormatter.stringFromDate(displayDate)
        
        cell!.textLabel!.text = stringDate
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction func addJournal(sender: AnyObject) {
//        let alert = UIAlertController(title: "New Entry",
//                                      message: "Add a new journal entry",
//                                      preferredStyle: .Alert)
//        
//        let saveAction = UIAlertAction(title: "Save",
//                                       style: .Default,
//                                       handler: { (action:UIAlertAction) -> Void in
//                                        
//                                        let textField = alert.textFields!.first
//                                        self.saveEntry(textField!.text!)
//                                        self.journalTableView.reloadData()
//        })
//        
//        let cancelAction = UIAlertAction(title: "Cancel",
//                                         style: .Default) { (action: UIAlertAction) -> Void in
//        }
//        
//        alert.addTextFieldWithConfigurationHandler {
//            (textField: UITextField) -> Void in
//        }
//        
//        alert.addAction(saveAction)
//        alert.addAction(cancelAction)
//        
//        presentViewController(alert,
//                              animated: true,
//                              completion: nil)
//    }
//    
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
//                                     insertIntoManagedObjectContext: managedContext)
//
//        theEntry.setValue(entry, forKey: "contents")
//        theEntry.setValue(currentDate, forKey: "datePublished")
//        
//        do {
//            try managedContext.save()
//            entries.append(theEntry)
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        entry = indexPath.row

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        performSegueWithIdentifier("journalSegue", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "journalSegue" {
            // Setup new view controller
            let destinationVC:JournalEntryViewController = segue.destinationViewController as! JournalEntryViewController
            destinationVC.entry = entries[entry]
            
            
        }
    }
    
    
}