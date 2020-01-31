//
//  MyLearningAppTests.swift
//  MyLearningAppTests
//
//  Created by Paul Tiriteu on 11/12/2019.
//  Copyright © 2019 Paul Tiriteu. All rights reserved.
//

import XCTest
@testable import MyLearningApp

class MyLearningAppTests: XCTestCase {
    var authRepository = AuthRepository()
    let registerRepository = RegisterRepository()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFirebaseRegisterAuthor_RegisterRepository() {
        let dummyAuthor = Author(email: "dummyauthor@email.com", name: "dummy author", password: "Qwerty12", publishingHouse: "dummyhouse")
        registerRepository.registerAuthor(author: dummyAuthor) { (author) in
            XCTAssertEqual(dummyAuthor, author)
        }
    }
    
    func testFirebaseRegisterCustomer_RegisterRepository() {
        let dummyCustomer = Customer(email: "dummycustomer@email.com", name: "dummy customer", password: "Qwerty12", phoneNumber: "0741986872", address: "strada Teodor Mihali")
        registerRepository.registerCustomer(customer: dummyCustomer) { (customer) in
            XCTAssertEqual(dummyCustomer, customer)
        }
    }

    func testFirebaseSignIn_AuthRepository() {
        authRepository.firebaseSignIn(email: "author@email.com", password: "Qwerty12") {
            print("success")
        }
    }
    
    func testSetCurrentAuthor_AuthRepository() {
        authRepository.setCurrentAuthor(id: "HBgzmDYI0pW9QyOioQBNMOgK8uj1") {
            print("success")
        }
    }
    
    func testSetCurrentCustomer_AuthRepository() {
        authRepository.setCurrentCustomer(id: "UUDJaLnZeWSGFEiIPwfqtveM1EG3") {
            print("success")
        }
    }
}
