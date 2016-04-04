//
//  EntryListViewController.swift
//  Journal_Redo
//
//  Created by Diego Aguirre on 4/4/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class EntryListViewController: UIViewController {

    @IBOutlet weak var entryTextView: UITextView!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension EntryListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedInstance.entryArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        let entry = EntryController.sharedInstance.entryArray[indexPath.row]
        
        cell.textLabel?.text = entry.body
        
        return cell
    }
}

extension EntryListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
//            var entry = EntryController.sharedInstance.entryArray[indexPath.row]
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}

extension EntryListViewController {
    
    @IBAction func addImageButtonPressed(sender: AnyObject) {
        
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        let entry = Entry(body: entryTextView.text, date: NSDate())
        EntryController.sharedInstance.entryArray.append(entry)
        self.tableview.reloadData()
    }
    
    func updateWithEntry(entry: Entry) {
        entryTextView.text = entry.body
    }
    
}


extension EntryListViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}