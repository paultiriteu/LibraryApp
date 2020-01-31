//
//  CreateAccountViewController.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 11/12/2019.
//  Copyright © 2019 Paul Tiriteu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    private let viewModel: RegisterViewModel
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        viewModel.register()
    }
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "RegisterViewController", bundle: Bundle(for: RegisterViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        registerButton.layer.cornerRadius = 10
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RegistrationTableViewCell", bundle: Bundle(for: RegistrationTableViewCell.self)), forCellReuseIdentifier: "RegistrationTableViewCell")
        
        titleLabel.text = viewModel.registrationPurpose == .book ? "Add a book" : "Create an account"
    }
}

extension RegisterViewController: UITableViewDelegate {
    
}

extension RegisterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.registrationFields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationTableViewCell", for: indexPath) as? RegistrationTableViewCell else { return UITableViewCell() }
        let registrationField = viewModel.registrationFields[indexPath.row]
        if let book = viewModel.book {
            if registrationField == "Title" {
                cell.configure(fieldName: registrationField, value: book.title)
            }
            
            if registrationField == "Publishing House" {
                cell.configure(fieldName: registrationField, value: book.publishingHouse)
            }
            
            if registrationField == "Description" {
                cell.configure(fieldName: registrationField, value: book.descriptionText)
            }
        } else {
            cell.configure(fieldName: registrationField, value: "")
        }
        viewModel.cells.append(cell)
        return cell
    }
}
