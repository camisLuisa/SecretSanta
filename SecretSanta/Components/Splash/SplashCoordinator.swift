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
        let splashViewController = SplashViewController()
        
        let timer = Timer(timeInterval: 3.0,
                          target: self,
                          selector: #selector(updateTimer),
                          userInfo: nil,
                          repeats: true)
        
        window.rootViewController = splashViewController
        window.makeKeyAndVisible()
        
        RunLoop.current.add(timer, forMode: .common)
        
        runCreateGroupFlow()
        
    }
    
    func runCreateGroupFlow() {
        let coordinator = CreateGroupCoordinator()
        coordinator.start()
        
        window.rootViewController = coordinator.rootViewController
        childCoordinators.append(coordinator)
        
    }
    
    @objc
    func updateTimer(){
        //nothing
    }
    
    
}
