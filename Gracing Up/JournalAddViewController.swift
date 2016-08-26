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

class JournalAddViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var entryTextView: UITextView!
    @IBOutlet weak var imagePicked: UIImageView!
    var imageData = NSData()
    
    @IBAction func addNewEntry(sender: AnyObject) {

        let entry = entryTextView!.text!
        
        let currentDate = NSDate()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("JournalEntryWithPictures", inManagedObjectContext:managedContext)
//        let entity =  NSEntityDescription.entityForName("JournalEntry", inManagedObjectContext:managedContext)
        
        let theEntry = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        theEntry.setValue(entry, forKey: "text")
        theEntry.setValue(currentDate, forKey: "datePublished")
        theEntry.setValue(imageData, forKey: "image")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        self.performSegueWithIdentifier("backToJournal", sender: nil)
    }
    
    @IBAction func openPhotoLibrary(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    // This sets the image chosen from the photo library as the image in the UIImageView
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imagePicked.image = image
        imageData = UIImageJPEGRepresentation(image, 1)!
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    
    
}