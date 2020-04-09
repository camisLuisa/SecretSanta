//
//  ApplicationCoordinator.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 08/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator]
    
    let window: UIWindow
    let splashCoordinator: Coordinator
    
    init(window: UIWindow, navigationController: UINavigationController, coordinator: Coordinator) {
        self.window = window
        self.splashCoordinator = coordinator
        self.childCoordinators = [coordinator]
        self.navigationController = navigationController
        
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        splashCoordinator.start()
    }
    
    
}