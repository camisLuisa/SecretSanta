//
//  EventDateMasker.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 01/05/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation.NSRegularExpression

struct EventDateMasker: TextFieldMasker {
    static var mask: TextFieldMaskClosure = { text in
        guard var text = text else { return ""}
        
        guard let regex = try? NSRegularExpression(pattern:  "[\\D]", options: NSRegularExpression.Options(rawValue: 0))
            else { return "" }
        let range = NSRange(location: 0, length: text.count)
        let modString = regex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "")
        
        var textResult = ""
        
        for (index, element) in modString.enumerated() {
            switch index {
            case 2, 4:
                textResult.append("/\(element)")
            default:
                textResult.append(element)
            }
        }
        
        if textResult.count > 10 {
            textResult = String(textResult[..<textResult.index( textResult.startIndex, offsetBy: 10)])
        }
        
        return textResult
        
    }
}
