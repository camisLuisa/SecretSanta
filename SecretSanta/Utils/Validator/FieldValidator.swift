//
//  FieldValidator.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 24/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation

protocol FieldValidator {
    func validation(text: String?) -> ValidatorResponse
}
