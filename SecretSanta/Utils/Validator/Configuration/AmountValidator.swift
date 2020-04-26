//
//  AmountValidator.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 24/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation

struct AmountValidator: FieldValidator {
    func formattedValue(text: String?) -> Double? {
        guard let text = text else { return nil }
        let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return nil }
        guard let regex = try? NSRegularExpression(pattern: "[\\D]", options: NSRegularExpression.Options(rawValue: 0)) else { return nil }
        let range = NSRange(location: 0, length: trimmedText.count)
        let modString = regex.stringByReplacingMatches(in: trimmedText, options: [], range: range, withTemplate: "")
        guard let value = Double(modString) else { return nil }
        return value / 100
    }
    
    func validation(text: String?) -> ValidatorResponse {
        guard let text = text else {
            return .failure(.empty)
        }
        
        let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimmedText.isEmpty {
            return .failure(.empty)
        }
        
        guard let regex = try? NSRegularExpression(pattern: "[\\D]", options: NSRegularExpression.Options(rawValue: 0)) else { return .failure(.invalid(.default)) }
        
        let range = NSRange(location: 0, length: trimmedText.count)
        let modString = regex.stringByReplacingMatches(in: trimmedText, options: [], range: range, withTemplate: "")
        
        guard var value = Double(modString) else { return .failure(.invalid(.default)) }
        
        value /= 100
        
        if value < 0.0 {
            return .failure(.invalid(.default))
        }
        
        return .success(())
    }
}
