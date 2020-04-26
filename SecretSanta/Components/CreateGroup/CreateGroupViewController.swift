//
//  CreateGroupViewController.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 11/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class CreateGroupViewController: UIViewController {
    // MARK: - Attributes -
    private let viewCreateGroup: CreateGroupView
    
    // MARK: - Init -
    init() {
        viewCreateGroup = CreateGroupView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        view = viewCreateGroup
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        viewCreateGroup.didTapAtCloseButton = {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
