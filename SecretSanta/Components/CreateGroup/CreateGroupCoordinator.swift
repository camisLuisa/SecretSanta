//
//  CreateGroupCoordinator.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 08/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class CreateGroupCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController? { return navigationController }
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController .navigationBar.shadowImage = UIImage()
    }
    
    func start() {
        let controller = GroupViewController(coordinator: self)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func goToCreateGroup() {
        let controller = CreateGroupViewController()
        navigationController.pushViewController(controller, animated: true)
    }
    
}
