//
//  Contact Controller.swift
//  Contacts
//
//  Created by Chance Robertson on 2/24/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import Foundation

class ContactController {
    
    private let cloudKitManager = CloudKitManager()
    static let shared = ContactController()
    var delegate: ContactControllerDelegate?
    
    var contacts: [Contact] = [] {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.contactsUpdated()
            }
        }
    }
    
    init() {
        fetchContacts()
    }
    
    func createContact(withNumber number: String, name: String, email: String) {
        
        let contact = Contact(number: number, name: name, email: email)
        let contactRecord = contact.cloudKitRecord
        
        cloudKitManager.saveRecord(contactRecord) { (record, error) in
            if let error = error {
                NSLog("Unable to save record to Cloudkit: \(error.localizedDescription)")
            }
        }
        contacts.insert(contact, at: 0)
    }
    
    func fetchContacts() {
        
        cloudKitManager.fetchRecordsWithType(Keys.recordType, recordFetchedBlock: nil) { (records, error) in
            if let error = error {
                NSLog("Unable to fetch records from CloudKit: \(error.localizedDescription)")
            }
            if let records = records {
                self.contacts = records.flatMap { Contact(record: $0) }
            }
        }
    }
}

protocol ContactControllerDelegate {
    func contactsUpdated()
}
