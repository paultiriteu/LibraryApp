//
//  AuthViewController.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 11/12/2019.
//  Copyright © 2019 Paul Tiriteu. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private let viewModel: AuthViewModel
    
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "AuthViewController", bundle: Bundle(for: AuthViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
//        viewModel.router.toLibraryViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func configureUI() {
        emailTextField.placeholder = "Enter your email"
        passwordTextField.placeholder = "Password"
        
        emailTextField.layer.cornerRadius = emailTextField.bounds.height / 2
        passwordTextField.layer.cornerRadius = passwordTextField.bounds.height / 2
        loginButton.layer.cornerRadius = 10
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        
        title = ""
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        viewModel.signIn(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func noAccountButtonAction(_ sender: Any) {
        viewModel.toRegisterViewController()
    }
}
