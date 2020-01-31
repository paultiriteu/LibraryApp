//
//  LibraryRepository.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 26/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import FirebaseDatabase

class LibraryRepository: BaseRepository {
    func getBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping() -> Void) {
        var books = [Book]()

        let booksRef = db.child("books")
        booksRef.observe(.value) { (snapshot) in
            for child in snapshot.children {
                let snapshotChild = child as! DataSnapshot
                let book = Book(snapshot: snapshotChild)
                book.id = snapshotChild.key
                books.append(book)
            }
            onSuccess(books)
        }

    }
    
    func getAuthor(id: String, onSuccess: @escaping (Author) -> Void, onError: @escaping (Error?) -> Void) {
        var author = Author(email: "", name: "", password: "", publishingHouse: "")
        let authorsRef = db.child("authors").child(id)
        authorsRef.observe(.value) { (snapshot) in
            author = Author(snapshot: snapshot)
            onSuccess(author)
        }
    }
}
