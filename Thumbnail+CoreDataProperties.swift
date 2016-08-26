//
//  Thumbnail+CoreDataProperties.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 8/24/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Thumbnail {

    @NSManaged var image: NSData?
    @NSManaged var fullRes: NSManagedObject?

}
