//
//  GroupViewController.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 08/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class GroupViewController: UIViewController {
    private let viewGroup: GroupView
    
    // MARK: - Init -
    init() {
        viewGroup = GroupView()
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
    }
    
}
