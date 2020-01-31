//
//  LibraryViewModel.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 26/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import Foundation

class LibraryViewModel {
    private let repository: LibraryRepository
    private let router: MainScreenRouter
    
    var books: [Book] = []
    var shouldHideAddBookButton: Bool {
        return Current.user?.role != .author
    }
    
    init(repository: LibraryRepository, router: MainScreenRouter) {
        self.repository = repository
        self.router = router
    }
    
    func getBooks(completion: @escaping () -> Void) {
        repository.getBooks(onSuccess: { books in
            self.books = books
            completion()
        }, onError: {
            completion()
        })
    }
    
    func getAuthor(id: String) {
        repository.getAuthor(id: id, onSuccess: { (author) in
            self.router.toAuthorProfileViewController(author: author)
        }) { (error) in
            
        }
    }
    
    func toBookProfileViewController(indexPath: IndexPath) {
        router.toBookProfileViewController(book: books[indexPath.row])
    }
    
    func toRegisterViewController(book: Book?) {
        router.toRegisterViewController(registrationPurpose: .book, book: book)
    }
    
    func logout() {
        Current.user = nil
        router.popToRootViewController()
    }
}
