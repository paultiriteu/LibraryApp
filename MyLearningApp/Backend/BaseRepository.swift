//
//  BaseRepository.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 25/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class BaseRepository {
    let db = Database.database().reference()
}
