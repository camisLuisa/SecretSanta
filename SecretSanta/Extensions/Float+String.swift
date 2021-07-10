//
//  Float+String.swift
//  SecretSanta
//
//  Created by Camila Luísa Farias on 10/07/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation

extension String {
    func getFloatFromString() -> Float {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: self)
        let numberFloatValue = number?.floatValue ?? 0

        return numberFloatValue
    }
}
