//
//  Contact.swift
//  Contacts
//
//  Created by Chance Robertson on 2/24/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import Foundation
import CloudKit

struct Contact {
    
    let number: String
    let name: String
    let email: String
    
    init(number: String, name: String, email: String) {
        
        self.number = number
        self.name = name
        self.email = email
    }
    
    // MARK: - CloudKit
    
    var cloudKitRecord: CKRecord {
        
        let record = CKRecord(recordType: Keys.recordType)
        record[Keys.numberKey] = number as CKRecordValue?
        record[Keys.nameKey] = name as CKRecordValue?
        record[Keys.emailKey] = email as CKRecordValue?
        
        return record
    }
    
    init?(record: CKRecord) {
        
        guard let number = record[Keys.numberKey] as? String,
            let name = record[Keys.nameKey] as? String,
            let email = record[Keys.emailKey] as? String else { return nil }
        
        self.init(number: number, name: name, email: email)
    }
}
