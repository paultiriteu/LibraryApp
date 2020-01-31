//
//  RegistrationTableViewCell.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 26/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import UIKit

protocol RegistrationTableViewCellDelegate {
    
}

class RegistrationTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    var textFieldValue: String = ""
    var isValid: Bool = true
    var fieldName: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.delegate = self
        
        configureUI()
    }
    
    func configure(fieldName: String, value: String = "") {
        self.fieldName = fieldName
        textField.placeholder = fieldName
        textField.text = value
        titleLabel.text = fieldName
        
        if fieldName == "Password" {
            textField.isSecureTextEntry = true
        }
    }
    
    func getValue() -> String {
        textFieldDidEndEditing(textField)
        return textFieldValue
    }
    
    private func configureUI() {
        selectionStyle = .none
    }
}

extension RegistrationTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        isValid = textField.text?.count ?? 0 > 4
        if isValid {
            textField.backgroundColor = .clear
            textFieldValue = textField.text ?? ""
        } else {
            textField.backgroundColor = UIColor(red: 100/255, green: 0/255, blue: 0/255, alpha: 0.5)
        }
    }
}
