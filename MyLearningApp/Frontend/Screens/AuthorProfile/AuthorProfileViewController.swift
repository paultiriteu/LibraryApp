//
//  AuthorProfileViewController.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 30/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import UIKit

class AuthorProfileViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var publishingHouseLabel: UILabel!
    
    private let author: Author
    
    init(author: Author) {
        self.author = author
        super.init(nibName: "AuthorProfileViewController", bundle: Bundle(for: AuthorProfileViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        nameLabel.text = author.name
        emailLabel.text = "Email: " + author.email
        publishingHouseLabel.text = "Publishing house: " + author.publishingHouse
    }
}
