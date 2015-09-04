//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Linjie Peng on 9/3/15.
//  Copyright © 2015 Linjie Peng. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    
    let myManager = ItemsManager()
    
    var itemsList = [ScavengerHuntItem(name: "Cat"), ScavengerHuntItem(name: "Bird"), ScavengerHuntItem(name: "Brick"), ScavengerHuntItem(name: "iPhone"), ScavengerHuntItem(name: "🌴")]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myManager.items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        
        let item = myManager.items[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
        
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addVC = segue.sourceViewController as! AddViewController
            if let newItem = addVC.newItem{
                myManager.items += [newItem]
                myManager.save()
                let indexPath = NSIndexPath(forRow: myManager.items.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }

}