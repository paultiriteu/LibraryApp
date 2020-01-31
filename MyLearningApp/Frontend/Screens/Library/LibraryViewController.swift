//
//  LibraryViewController.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 26/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBookButton: UIButton!
    
    private let viewModel: LibraryViewModel
    
    @IBAction func addBookTapped(_ sender: Any) {
        viewModel.toRegisterViewController(book: nil)
    }
    
    init(viewModel: LibraryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "LibraryViewController", bundle: Bundle(for: LibraryViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: Bundle(for: BookTableViewCell.self)), forCellReuseIdentifier: "BookTableViewCell")
    
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getBooks(completion: {
            self.tableView.reloadData()
        })        
    }
    
    private func configureUI() {
        addBookButton.layer.cornerRadius = 10
        
        self.addBookButton.isHidden = self.viewModel.shouldHideAddBookButton
        
        navigationItem.hidesBackButton = true
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logout)), animated: true)
    }
    
    @objc private func logout() {
        viewModel.logout()
    }
}

extension LibraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.toBookProfileViewController(indexPath: indexPath)
    }
}

extension LibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(book: viewModel.books[indexPath.row], viewModel: viewModel)
        return cell
    }
}
