//
//  AuthViewModel.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 11/12/2019.
//  Copyright © 2019 Paul Tiriteu. All rights reserved.
//

import Foundation

class AuthViewModel {
    private let repository: AuthRepository
    let router: MainScreenRouter
    
    init(repository: AuthRepository, router: MainScreenRouter) {
        self.repository = repository
        self.router = router
    }
    
    func signIn(email: String, password: String) {
        repository.firebaseSignIn(email: email, password: password) {
            self.router.toLibraryViewController()
        }
    }
    
    func toRegisterViewController() {
        router.toJourneyViewController()
    }
}
