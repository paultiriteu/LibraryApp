//
//  BookProfileViewModel.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 29/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import Foundation

class BookProfileViewModel {
    private let book: Book
    private let repository: BookRepository
    private let router: MainScreenRouter
    
    var shouldHideEditButton: Bool {
        return book.authorId != Current.user?.id
    }
    
    init(book: Book, repository: BookRepository, router: MainScreenRouter) {
        self.book = book
        self.repository = repository
        self.router = router
    }
    
    func getBookTitle() -> String {
        return book.title
    }
    
    func getAuthorName() -> String {
        return book.authorName
    }
    
    func getPublishingHouse() -> String {
        return book.publishingHouse
    }
    
    func getDescription() -> String {
        return book.descriptionText
    }
    
    func editBook() {
        router.popViewController {
            self.router.toRegisterViewController(registrationPurpose: .book, book: self.book)
        }
    }
    
    func deleteBook() {
        repository.deleteBook(id: book.id) {
            self.router.popViewController { }
        }
    }
}
