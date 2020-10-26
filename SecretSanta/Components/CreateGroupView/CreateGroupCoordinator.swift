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
        self.navigationController.navigationBar.shadowImage = UIImage()
        
        self.navigationController.navigationBar.barTintColor = ColorName.white1.color
    }
    
    func start() {
        let controller = GroupViewController(coordinator: self)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func goToNextCreateGroup(type: FormInputViewType) {
        switch type {
        case .groupName:
            let controller = CreateGroupViewController(type: CreateGroupViewType.amount, coordinator: self)
            
            navigationController.pushViewController(controller, animated: true)
        case .amount:
            let controller = CreateGroupViewController(type: CreateGroupViewType.eventDate, coordinator: self)
            
            navigationController.pushViewController(controller, animated: true)
        case .eventDate:
           goToParticipants()
        }
    }
    
    func goToCreateGroup() {
        let controller = CreateGroupViewController(type: CreateGroupViewType.groupName, coordinator: self)
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToParticipants() {
        let controller = ParticipantsViewController(coordinator: self)
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToAddParticipants() {
        let controller = AddParticipantAlertViewController()
        controller.modalPresentationStyle = .overCurrentContext
        
        navigationController.present(controller, animated: true, completion: nil)
    }
}
