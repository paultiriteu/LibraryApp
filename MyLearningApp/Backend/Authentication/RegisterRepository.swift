//
//  RegisterRepository.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 11/12/2019.
//  Copyright © 2019 Paul Tiriteu. All rights reserved.
//

import Foundation
import Firebase

class RegisterRepository: BaseRepository {
    func registerAuthor(author: Author, completion: @escaping (Author) -> Void) {
        Auth.auth().createUser(withEmail: author.email, password: author.password) { (result, err) in
            if err != nil {
                return
            }
            
            guard let uid = result?.user.uid else {
                return
            }
            
            let usersRef = self.db.child("users").child(uid)
            usersRef.updateChildValues(["email": author.email!,
                                        "name": author.name,
                                        "role": "author"],
                withCompletionBlock: { (result, error) in
                let authorsRef = self.db.child("authors").child(uid)
                    authorsRef.updateChildValues(["email": author.email!,
                                                  "name": author.name,
                                                  "publishing_house": author.publishingHouse],
                 withCompletionBlock: { (_,_) in
                    print("success")
                    Current.user = author
                    Current.user?.id = uid
                    completion(author)
                })
            })
        }
    }
    
    func registerCustomer(customer: Customer, completion: @escaping (Customer) -> Void) {
        Auth.auth().createUser(withEmail: customer.email, password: customer.password) { (result, err) in
            if err != nil {
                return
            }
            
            guard let uid = result?.user.uid else {
                return
            }
            
            let usersRef = self.db.child("users").child(uid)
            usersRef.updateChildValues(["email": customer.email!,
                                        "name": customer.name,
                                        "role": "customer"],
                withCompletionBlock: { (result, error) in
                let customersRef = self.db.child("customers").child(uid)
                customersRef.updateChildValues(["email": customer.email,
                                                "name": customer.name,
                                                "address": customer.address,
                                                "phone_number": customer.phoneNumber],
                    withCompletionBlock: { (result, error) in
                        print("success")
                        Current.user = customer
                        Current.user?.id = uid
                        completion(customer)
                })
            })
        }
    }
    
    func editBook(book: Book, completion: @escaping () -> Void) {
        let booksRef = self.db.child("books").child(book.id)

        booksRef.updateChildValues(["title": book.title,
                                    "author_id": Current.user?.id,
                                    "author_name": Current.user?.name,
                                    "publishing_house": book.publishingHouse,
                                    "description": book.descriptionText],
        withCompletionBlock: { (error, result) in
            completion()
        })
    }
    
    func addBook(book: Book, completion: @escaping (Book) -> Void) {
        let booksRef = self.db.child("books").childByAutoId()

        booksRef.updateChildValues(["title": book.title,
                                    "author_id": Current.user?.id,
                                    "author_name": Current.user?.name,
                                    "publishing_house": book.publishingHouse,
                                    "description": book.descriptionText],
       withCompletionBlock: { (error, result) in
            book.id = result.key ?? ""
            completion(book)
        })
    }
}
