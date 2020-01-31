//
//  Customer.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 26/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import FirebaseDatabase

class Customer: NSObject, User {
    var id: String = ""
    var email: String!
    var name: String
    var password: String = ""
    var phoneNumber: String
    var address: String
    var role: Role = .customer
    
    init(email: String, name: String, password: String, phoneNumber: String, address: String) {
        self.email = email
        self.name = name
        self.password = password
        self.phoneNumber = phoneNumber
        self.address = address
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: Any]
        
        self.id = snapshotValue["id"] as! String
        self.email = snapshotValue["email"] as! String
        self.name = snapshotValue["name"] as! String
        self.phoneNumber = snapshotValue["phone_number"] as! String
        self.address = snapshotValue["address"] as! String
    }
}
