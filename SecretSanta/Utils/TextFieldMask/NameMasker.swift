//
//  NameMasker.swift
//  SecretSanta
//
//  Created by Camila Luísa on 10/02/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation.NSRegularExpression

struct NameMasker: TextFieldMasker {
    static var mask: TextFieldMaskClosure = { text in
        guard var text = text else { return ""}
        
        guard let regex = try? NSRegularExpression(pattern:  "[\\D]", options: NSRegularExpression.Options(rawValue: 0))
            else { return "" }
        let range = NSRange(location: 0, length: text.count)
        let modString = regex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "")
        
        var textResult = ""

        
        if textResult.count > 10 {
            textResult = String(textResult[..<textResult.index( textResult.startIndex, offsetBy: 10)])
        }
        
        return textResult
        
    }
}
