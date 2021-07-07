//
//  LoginEmailValidor.swift
//  SecretSanta
//
//  Created by Camila Luísa on 17/02/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation

struct LoginEmailValidator: FieldValidator {
    func validation(text: String?) -> ValidatorResponse {
        guard let text = text, !text.isEmpty else {
            return .failure(.empty)
        }

        if text.count < 10 {
            return .failure(.tooShort)
        }
        
        if text.count > 50 {
            return .failure(.tooLong)
        }
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        if !(emailPredicate.evaluate(with: text)) {
            return .failure(.invalid(.wrongFormat))
        }
        
        return .success(())
    }
}
