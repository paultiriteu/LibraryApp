//
//  Author.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 26/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import FirebaseDatabase

class Author: NSObject, User {
    var id: String = ""
    var email: String!
    var name: String
    var password: String = ""
    var publishingHouse: String
    var role: Role = .author
    
    init(email: String, name: String, password: String, publishingHouse: String) {
        self.email = email
        self.name = name
        self.password = password
        self.publishingHouse = publishingHouse
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: Any]
        
        self.email = snapshotValue["email"] as! String
        self.name = snapshotValue["name"] as! String
        self.publishingHouse = snapshotValue["publishing_house"] as! String
    }
}
