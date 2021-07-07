//
//  InputDelegate.swift
//  SecretSanta
//
//  Created by Camila Luísa on 03/03/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation

protocol InputDelegate: AnyObject {
    func validateInput(validatorStatus: ValidatorResponse)
}
