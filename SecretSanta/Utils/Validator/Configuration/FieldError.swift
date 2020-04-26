//
//  FieldError.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 24/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation

enum FieldError: Error {
    case empty
    case incomplete
    case invalid(InvalidFieldReason)
}

enum InvalidFieldReason {
    case wrongFormat
    case experiedDate
    case `default`
}

extension FieldError: Equatable {
    static func == (lhs: FieldError, rhs: FieldError) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
        case (.incomplete, .incomplete):
            return true
        case (.invalid(let lhsReason), .invalid(let rhsReason)):
            if lhsReason == rhsReason {
                return true
            }
            return false
        default:
            return false
        }
    }
}
