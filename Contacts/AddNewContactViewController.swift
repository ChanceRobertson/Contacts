//
//  AddNewContactViewController.swift
//  Contacts
//
//  Created by Chance Robertson on 2/24/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import UIKit

class AddNewContactViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UI Actions
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let number = numberTextField.text,
            let name = nameTextField.text,
            let email = emailTextField.text else { return }
        
        if number.isEmpty {
            let alertController = UIAlertController(title: "Missing Information", message: "Make sure to fill out the name required field.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            ContactController.shared.createContact(withNumber: number, name: name, email: email)
            dismiss(animated: true, completion: nil)
        }
    }
}
