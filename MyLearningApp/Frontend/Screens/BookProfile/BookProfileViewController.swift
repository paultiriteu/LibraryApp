//
//  BookProfileViewController.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 29/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import UIKit

class BookProfileViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    private let viewModel: BookProfileViewModel
    
    @IBAction func editButtonTapped(_ sender: Any) {
        viewModel.editBook()
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        viewModel.deleteBook()
    }
    
    init(viewModel: BookProfileViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: "BookProfileViewController", bundle: Bundle(for: BookProfileViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        titleLabel.text = viewModel.getBookTitle()
        authorLabel.text = "by " + viewModel.getAuthorName()
        editButton.isHidden = viewModel.shouldHideEditButton
        textView.text = viewModel.getDescription()
    }
}
