//
//  ContactInput.swift
//  eContacts
//
//  Created by Thomas on 10/7/14.
//  Copyright (c) 2014 Tom Brunkow. All rights reserved.
//

import UIKit

protocol didUpdateContact {
    func dataUpdated(sender: AnyObject, aName: String, aPhoneNumber: String)
}

class ContactInput: UIViewController, UITextFieldDelegate   {

    //Properties
    var nameFromInput = ""
    var phoneFromInput = ""
    var delegateFromInput: didUpdateContact?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameField.delegate = self
        self.phoneField.delegate = self 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField.tag == 1 {
            self.nameFromInput = nameField.text
        }
        else if textField.tag == 2 {
            self.phoneFromInput = phoneField.text
        }
        
        textField.resignFirstResponder()
        return true
    }
   
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if nameFromInput != "" && phoneFromInput != "" {
            self.delegateFromInput!.dataUpdated(self, aName: nameFromInput, aPhoneNumber: phoneFromInput)
        }
    }
    

}
