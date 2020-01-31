//
//  BookTableViewCell.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 28/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorButton: UIButton!
    @IBOutlet weak var publishingHouseLabel: UILabel!
    
    private var viewModel: LibraryViewModel?
    private var authorId: String?
    
    @IBAction func authorButtonTapped(_ sender: Any) {
        guard (viewModel != nil), (authorId != nil) else { return }
        viewModel!.getAuthor(id: authorId!)
    }
    
    func configure(book: Book, viewModel: LibraryViewModel) {
        self.viewModel = viewModel
        self.authorId = book.authorId

        titleLabel.text = book.title
        publishingHouseLabel.text = book.publishingHouse
        authorButton.setTitle(book.authorName, for: .normal)
    }
}
