//
//  GroupNameValidator.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 26/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation

struct GroupNameValidator: FieldValidator {
    func validation(text: String?) -> ValidatorResponse {
        guard let text = text, !text.isEmpty else {
            return .failure(.empty)
        }
        
        if text.count > 10 {
            return .failure(.incomplete)
        }
        
        return .success(())
    }
}
