//
//  AuthRepository.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 11/12/2019.
//  Copyright © 2019 Paul Tiriteu. All rights reserved.
//

import Firebase

class AuthRepository: BaseRepository {
    func firebaseSignIn(email: String, password: String, completion: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            guard let userUid = result?.user.uid else { return }
            let usersPath = self.db.child("users").child(userUid)
            usersPath.observe(.value) { (snapshot) in
                let snapshotValue = snapshot.value as! [String: String]
                if snapshotValue["role"] == "author" {
                    self.setCurrentAuthor(id: userUid) {
                        completion()                        
                    }
                }
                
                if snapshotValue["role"] == "customer" {
                    self.setCurrentCustomer(id: userUid) {
                        completion()
                    }
                }
            }
        }
    }
    
    func setCurrentAuthor(id: String, completion: @escaping () -> Void) {
        let authorsRef = db.child("authors").child(id)
        authorsRef.observe(.value) { (snapshot) in
            Current.user = Author(snapshot: snapshot)
            Current.user?.id = id
            completion()
        }
    }
    
    func setCurrentCustomer(id: String, completion: @escaping () -> Void) {
        let customersRef = db.child("customers").child(id)
        customersRef.observe(.value) { (snapshot) in
            Current.user = Customer(snapshot: snapshot)
            Current.user?.id = id
            completion()
        }
    }
}
