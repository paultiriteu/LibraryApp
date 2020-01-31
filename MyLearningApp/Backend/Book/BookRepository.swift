//
//  BookRepository.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 30/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import Foundation

class BookRepository: BaseRepository {
    func deleteBook(id: String, completion: @escaping () -> Void) {
        let booksRef = db.child("books").child(id)
        
        booksRef.removeValue { (error, reference) in
            if error == nil {
                completion()
            }
        }
    }
}
