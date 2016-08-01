//
//  FileReadWrite.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 7/26/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation

class File {
    class func open(path: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        if NSFileManager().fileExistsAtPath(path) {
            do {
                return try String(contentsOfFile: path, encoding: encoding)
            } catch let error as NSError {
                print(error.code)
                return nil
            }
        }
        return  nil
    }
    class func save(path: String, _ content: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> Bool {
        do {
            try content.writeToFile(path, atomically: true, encoding: encoding)
            return true
        } catch let error as NSError {
            print(error.code)
            return false
        }
    }
}