//
//  ItemsManager.swift
//  ScavengerHunt
//
//  Created by Linjie Peng on 9/4/15.
//  Copyright © 2015 Linjie Peng. All rights reserved.
//

import Foundation

class ItemsManager {
    var items = [ScavengerHuntItem]()
    
    func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
            if let documentSPath = directoryList.first {
                return documentSPath + "/ScanvengerHuntItems"
            }
        
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if !NSKeyedArchiver.archiveRootObject(items, toFile: theArchivePath) {
                assertionFailure("Could not save data to \(theArchivePath)")
            }
        } else {
            assertionFailure("Could not determine where to save file!")
        }
        
    }
    
    func unarchivedSavedItems() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                items = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [ScavengerHuntItem]
            }
        }
    }
    
    init() {
        unarchivedSavedItems()
    }
}
