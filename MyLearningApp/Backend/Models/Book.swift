//
//  Book.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 26/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import FirebaseDatabase

class Book: NSObject {
    var id: String = ""
    var title: String
    var authorId: String?
    var authorName: String
    var publishingHouse: String
    var descriptionText: String
    
    init(title: String, authorId: String?, authorName: String, publishingHouse: String, descriptionText: String) {
        self.title = title
        self.authorId = authorId
        self.authorName = authorName
        self.publishingHouse = publishingHouse
        self.descriptionText = descriptionText
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: Any]
        
        self.title = snapshotValue["title"] as! String
        self.authorId = snapshotValue["author_id"] as? String ?? ""
        self.authorName = snapshotValue["author_name"] as! String
        self.publishingHouse = snapshotValue["publishing_house"] as! String
        self.descriptionText = snapshotValue["description"] as! String
    }
}
