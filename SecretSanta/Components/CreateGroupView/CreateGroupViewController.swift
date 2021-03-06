//
//  CreateGroupViewController.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 11/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

protocol CreateGroupDelegate: AnyObject {
    func getGroupInfo(content: String, type: CreateGroupViewType)
}

final class CreateGroupViewController: UIViewController {
    // MARK: - Attributes -
    private let viewCreateGroup: CreateGroupView
    private let coordinator: CreateGroupCoordinator
    weak var delegate: CreateGroupDelegate?
    
    // MARK: - Init -
    init(type: CreateGroupViewType, coordinator: CreateGroupCoordinator) {
        viewCreateGroup = CreateGroupView(type: type)
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        view = viewCreateGroup
        super.viewDidLoad()
        
        viewCreateGroup.didTapAtCloseButton = {
            self.navigationController?.popViewController(animated: true)
        }
        
        self.viewCreateGroup.didTapAtNextButton = { type, content in
            self.coordinator.goToNextCreateGroup(type: type, content: content)
        }
    }
    
    override func loadView() {
        setupView()
    }
    
    // MARK: - Setup View -
    func setupView() {
        self.navigationItem.setHidesBackButton(false, animated: false)
        self.navigationController?.navigationBar.tintColor = .white
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
