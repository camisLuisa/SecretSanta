//
//  DateValidator.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 24/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation.NSCalendar
import Foundation.NSCharacterSet

struct EventDateValidator: FieldValidator {
    func validation(text: String?) -> ValidatorResponse {
        guard let text = text else { return .failure(.empty) }
        
        let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimmedText.isEmpty {
            return .failure(.empty)
        }
        
        let textLength = trimmedText.count
        if textLength < 10 {
            return .failure(.incomplete)
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.calendar = .current
        guard let eventDate = dateFormatter.date(from: text) else {
            return .failure(.invalid(.wrongFormat))
        }
        
        let now = Date()
        guard now > eventDate else {
            return .failure(.invalid(.experiedDate))
        }
        
        return .success(())
    }
}
