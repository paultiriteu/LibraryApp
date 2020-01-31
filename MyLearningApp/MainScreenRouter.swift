//
//  MainScreenRouter.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 11/12/2019.
//  Copyright © 2019 Paul Tiriteu. All rights reserved.
//

import UIKit

class MainScreenRouter {
    var navController = UINavigationController()
    
    func getAuthViewController() -> UIViewController {
        let repository = AuthRepository()
        let viewModel = AuthViewModel(repository: repository, router: self)
        let viewController = AuthViewController(viewModel: viewModel)
        
        navController = UINavigationController(rootViewController: viewController)
        
        return navController
    }
    
    func toJourneyViewController() {
        let viewController = JourneyViewController(router: self)
        navController.pushViewController(viewController, animated: true)
    }
    
    func toRegisterViewController(registrationPurpose: RegistrationPurpose, book: Book?) {
        let repository = RegisterRepository()
        let viewModel = RegisterViewModel(registrationPurpose: registrationPurpose, existingBook: book, repository: repository, router: self)
        let viewController = RegisterViewController(viewModel: viewModel)
        navController.pushViewController(viewController, animated: true)
    }
    
    func toLibraryViewController() {
        let repository = LibraryRepository()
        let viewModel = LibraryViewModel(repository: repository, router: self)
        let viewController = LibraryViewController(viewModel: viewModel)
        navController.pushViewController(viewController, animated: true)
    }
    
    func toBookProfileViewController(book: Book) {
        let repository = BookRepository()
        let viewModel = BookProfileViewModel(book: book, repository: repository, router: self)
        let viewController = BookProfileViewController(viewModel: viewModel)
        navController.pushViewController(viewController, animated: true)
    }
    
    func toAuthorProfileViewController(author: Author) {
        let viewController = AuthorProfileViewController(author: author)
        navController.pushViewController(viewController, animated: true)
    }
    
    func popViewController(completion: @escaping () -> Void) {
        navController.popViewController(animated: true)
        completion()
    }
    
    func dismiss(completion: @escaping () -> Void) {
        navController.dismiss(animated: true, completion: completion)
    }
    
    func popToRootViewController() {
        navController.popToRootViewController(animated: true)
    }
}
