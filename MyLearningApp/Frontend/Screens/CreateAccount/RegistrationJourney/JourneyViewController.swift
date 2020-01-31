//
//  JourneyViewController.swift
//  MyLearningApp
//
//  Created by Paul Tiriteu on 26/01/2020.
//  Copyright © 2020 Paul Tiriteu. All rights reserved.
//

import UIKit

class JourneyViewController: UIViewController {
    @IBOutlet weak var customerButton: UIButton!
    @IBOutlet weak var authorButton: UIButton!
    
    private let router: MainScreenRouter
    
    @IBAction func customerButtonTapped(_ sender: Any) {
        router.toRegisterViewController(registrationPurpose: .customer, book: nil)
    }
    
    @IBAction func authorButtonTapped(_ sender: Any) {
        router.toRegisterViewController(registrationPurpose: .author, book: nil)
    }
    
    init(router: MainScreenRouter) {
        self.router = router
        super.init(nibName: "JourneyViewController", bundle: Bundle(for: JourneyViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        customerButton.setTitle("I want to register as a customer", for: .normal)
        authorButton.setTitle("I want to register as an author", for: .normal)
        
        customerButton.layer.cornerRadius = 10
        authorButton.layer.cornerRadius = 10
        
        customerButton.backgroundColor = .init(red: 100/255, green: 100/255, blue: 190/255, alpha: 1)
        authorButton.backgroundColor = .init(red: 100/255, green: 190/255, blue: 100/255, alpha: 1)
    }
}
