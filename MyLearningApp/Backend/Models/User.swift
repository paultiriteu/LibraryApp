//
//  User.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 25/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import Foundation

protocol User: Codable {
    var id: String { get set }
    var email: String! { get }
    var name: String { get }
    var role: Role { get }
}
