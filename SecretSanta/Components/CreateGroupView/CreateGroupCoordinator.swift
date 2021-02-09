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
    var friendGroup: FriendGroup?
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController.navigationBar.shadowImage = UIImage()
        self.navigationController.navigationBar.isTranslucent = true        
    }
    
    func start() {
        let controller = GroupViewController(coordinator: self)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func goToNextCreateGroup(type: FormInputViewType, content: String = "") {
        switch type {
        case .groupName:
            let controller = CreateGroupViewController(type: CreateGroupViewType.amount, coordinator: self)
            
            navigationController.pushViewController(controller, animated: true)
        case .amount:
            let controller = CreateGroupViewController(type: CreateGroupViewType.eventDate, coordinator: self)
            
            navigationController.pushViewController(controller, animated: true)
//            friendGroup?.name = content
        case .eventDate:
//           goToParticipants()
            navigationController.popToRootViewController(animated: true)
        
        }
    }
    
    func goToGroupScreen() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let eventDate = formatter.date(from: "10/08/2021")

        let friendGroup = FriendGroup(name: "Amigos", friends: [], minimumValue: 200.0, eventDate: eventDate!)
        
        let controller = GroupViewController(coordinator: self)
        controller.friendGroup = friendGroup
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func goToCreateGroup() {
//        friendGroup = FriendGroup(name: "", friends: [], minimumValue: 0.0, eventDate: Date())
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
