//
//  Contacts.swift
//  eContacts
//
//  Created by Thomas on 10/7/14.
//  Copyright (c) 2014 Tom Brunkow. All rights reserved.
//

import UIKit

class Contacts: UITableViewController, didUpdateContact  {

    struct ContactInfo {
        var name: String
        var phoneNumber: String
    }
    
    var listOfContacts: [ContactInfo] = []
    
    // Sample Contacts 
    var firstContact = ContactInfo(name: "Paul Graham", phoneNumber: "(952) 929-6081)")
    var secondContact = ContactInfo(name: "Mark Suster", phoneNumber: "(612) 927-7079")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Do any additional setup after loading the view, typically from a nib. 
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        listOfContacts.append(firstContact)
        listOfContacts.append(secondContact)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
       
        return listOfContacts.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contact", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel!.text = listOfContacts[indexPath.row].name
        cell.detailTextLabel!.text = listOfContacts[indexPath.row].phoneNumber
        
        return cell
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ToDetail" {
         
            let indexPath = self.tableView.indexPathForSelectedRow()
            let theSelected = listOfContacts[indexPath!.row]
            let theDestination = (segue.destinationViewController as ContactDetails)
            
            theDestination.nameDetail = theSelected.name
            theDestination.phoneDetail = theSelected.phoneNumber    
            
        }
        
        if segue.identifier == "ToInput"    {
            (segue.destinationViewController as ContactInput).delegateFromInput = self
        }
    }
    
    
    func dataUpdated(sender: AnyObject, aName: String, aPhoneNumber: String) {
        
        var newContact = ContactInfo(name: aName, phoneNumber: aPhoneNumber)
        listOfContacts.append(newContact)
        
        self.tableView.reloadData()
        
    }
    
   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
        if editingStyle == .Delete {
            listOfContacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
            let fromContact = listOfContacts[sourceIndexPath.row]
            listOfContacts.removeAtIndex(sourceIndexPath.row)
            listOfContacts.insert(fromContact, atIndex: destinationIndexPath.row)
    }
    
}
