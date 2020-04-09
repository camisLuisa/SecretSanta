//
//  Coordinator.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 08/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
