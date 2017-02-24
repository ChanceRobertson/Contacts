//
//  ContactViewController.swift
//  Contacts
//
//  Created by Chance Robertson on 2/24/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var contact: Contact?
    
    // MARK: - Properties
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contact = contact else { return }
        nameTextField.text = contact.name
        numberTextField.text = "\(contact.number)"
        emailTextField.text = contact.email
    }
    
    // MARK: - UI Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        // I know it won't edit because I haven't implemented the CK function modifyRecords. I would like some help knowing how to do that.
        _ = navigationController?.popViewController(animated: true)
    }
}
