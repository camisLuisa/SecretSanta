//
//  SplashCoordinator.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 08/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class SplashCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    let window: UIWindow
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let loginViewController = UserLoginViewController()
        loginViewController.coordinator = self
        
        navigationController.pushViewController(loginViewController, animated: true)
    }

    func runCreateGroupFlow() {
        let coordinator = CreateGroupCoordinator()
        coordinator.start()
        
        window.rootViewController = coordinator.rootViewController
        childCoordinators.append(coordinator)
    }
    
    func GoToCreateAccount() {
        let createAccountViewController = CreateUserLoginViewController()
        
        navigationController.pushViewController(createAccountViewController, animated: true)
    }
}
