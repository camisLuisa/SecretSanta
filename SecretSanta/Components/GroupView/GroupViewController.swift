//
//  GroupViewController.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 08/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class GroupViewController: UIViewController {
    
    // MARK: - Attributes -
    private let viewGroup: GroupView
    private let coordinator: CreateGroupCoordinator
    
    // MARK: - Init -
    init(coordinator: CreateGroupCoordinator) {
        self.viewGroup = GroupView()
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        view = viewGroup
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewGroup.didSelectAddGroup = {
            self.coordinator.goToCreateGroup()
        }
    }
    
}
