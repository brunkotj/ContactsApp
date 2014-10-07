//
//  ContactDetails.swift
//  eContacts
//
//  Created by Thomas on 10/7/14.
//  Copyright (c) 2014 Tom Brunkow. All rights reserved.
//

import UIKit

class ContactDetails: UIViewController {
    
    //Properties
    var nameDetail = ""
    var phoneDetail = ""
    
    @IBOutlet weak var nameDetailLabel: UILabel!
    @IBOutlet weak var phoneNumberDetailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameDetailLabel.text = nameDetail
        self.phoneNumberDetailLabel.text = phoneDetail
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
