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
    @IBOutlet weak var newJournal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "\"The List\""
        journalTableView.registerClass(UITableViewCell.self,
                                forCellReuseIdentifier: "Cell")
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
        
        
        //let dateFormatter = NSDateFormatter()
        //dateFormatter.locale = NSLocale.currentLocale()
        //dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        //dateFormatter.stringFromDate(currentDate)
        
        cell!.textLabel!.text =
            entry.valueForKey("datePublished") as? String
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addJournal(sender: AnyObject) {
        let alert = UIAlertController(title: "New Entry",
                                      message: "Add a new journal entry",
                                      preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields!.first
                                        self.saveEntry(textField!.text!)
                                        self.journalTableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
                              animated: true,
                              completion: nil)
    }
    
    func saveEntry(entry: String) {
        let currentDate = NSDate()
        
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("JournalEntry",
                                                        inManagedObjectContext:managedContext)
        
        let theEntry = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)

        theEntry.setValue(entry, forKey: "contents")
        theEntry.setValue(currentDate, forKey: "datePublished")
        
        do {
            try managedContext.save()
            entries.append(theEntry)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
}