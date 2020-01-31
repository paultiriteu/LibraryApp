//
//  RegisterViewModel.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 11/12/2019.
//  Copyright © 2019 Paul Tiriteu. All rights reserved.
//

import Foundation

enum RegistrationPurpose {
    case author
    case customer
    case book
}

class RegisterViewModel {
    private let repository: RegisterRepository
    private let router: MainScreenRouter
    let book: Book?
    let registrationPurpose: RegistrationPurpose
    var cells = [RegistrationTableViewCell]()
    
    var registrationFields: [String] {
        switch registrationPurpose {
        case .author:
            return ["Name", "Email", "Password", "Publishing House"]
        case .customer:
            return ["Name", "Email", "Password", "Phone number", "Address"]
        case .book:
            return ["Title", "Publishing House", "Description"]
        }
    }
    
    init(registrationPurpose: RegistrationPurpose, existingBook: Book?, repository: RegisterRepository, router: MainScreenRouter) {
        self.registrationPurpose = registrationPurpose
        self.book = existingBook
        self.repository = repository
        self.router = router
    }
    
    func register(editBook: Bool = false) {
        switch registrationPurpose {
        case .author: registerAuthor()
        case .customer: registerCustomer()
        case .book: registerBook()
        }
    }
    
    private func registerAuthor() {
        var allCellsAreValid = true
        var author = Author(email: "", name: "", password: "", publishingHouse: "")
        
        cells.forEach { (cell) in
            if !cell.isValid {
                allCellsAreValid = false
                return
            }
            
            if cell.fieldName == "Name" {
                author.name = cell.getValue()
            }
            
            if cell.fieldName == "Email" {
                author.email = cell.getValue()
            }
            
            if cell.fieldName == "Password" {
                author.password = cell.getValue()
            }
            
            if cell.fieldName == "Publishing House" {
                author.publishingHouse = cell.getValue()
            }
        }
        
        if allCellsAreValid {
            repository.registerAuthor(author: author, completion: { _ in
                self.router.toLibraryViewController()
            })
        }
    }
    
    private func registerCustomer() {
        var allCellsAreValid = true
        var customer = Customer(email: "", name: "", password: "", phoneNumber: "", address: "")
        
        cells.forEach { (cell) in
            if !cell.isValid {
                allCellsAreValid = false
                return
            }
            
            if cell.fieldName == "Name" {
                customer.name = cell.getValue()
            }
            
            if cell.fieldName == "Email" {
                customer.email = cell.getValue()
            }
            
            if cell.fieldName == "Password" {
                customer.password = cell.getValue()
            }
            
            if cell.fieldName == "Phone number" {
                customer.phoneNumber = cell.getValue()
            }
            
            if cell.fieldName == "Address" {
                customer.address = cell.getValue()
            }
        }
        
        if allCellsAreValid {
            repository.registerCustomer(customer: customer, completion: { _ in
                self.router.toLibraryViewController()
            })
        }
    }
    
    func registerBook() {
        var allCellsAreValid = true
        var book = Book(title: "", authorId: "", authorName: "", publishingHouse: "", descriptionText: "")
        
        cells.forEach { (cell) in
            if !cell.isValid {
                allCellsAreValid = false
                return
            }
            
            if cell.fieldName == "Title" {
                book.title = cell.getValue()
            }
            
            if cell.fieldName == "Publishing House" {
                book.publishingHouse = cell.getValue()
            }
            
            if cell.fieldName == "Description" {
                book.descriptionText = cell.getValue()
            }
        }
        
        if allCellsAreValid {
            guard let existingBook = self.book else {
                repository.addBook(book: book) { (book) in
                    self.router.popViewController() {
                        self.router.toBookProfileViewController(book: book)
                    }
                }
                return
            }
            
            book.id = existingBook.id
            repository.editBook(book: book) {
                self.router.popViewController {
                    self.router.toBookProfileViewController(book: book)
                }
            }
        }
    }
}
