//
//  ValidatorResponse.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 24/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation

typealias ValidatorResponse = Result<Void, FieldError>

extension ValidatorResponse {
    static func == (lhs: ValidatorResponse, rhs: ValidatorResponse) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        case (.failure(let lhsError), .failure(let rhsError)):
            return lhsError == rhsError
        default:
            return false
        }
    }
}
