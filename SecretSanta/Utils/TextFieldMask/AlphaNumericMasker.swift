//
//  AlphaMasker.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 01/05/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

struct AlphaNumericMasker: TextFieldMasker {
    static var mask: TextFieldMaskClosure = { text in
        guard let text = text else { return "" }
        return text.toAlphanumeric()
        
    }
}
