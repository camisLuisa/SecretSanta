//
//  TexFieldMasker.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 01/05/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//
typealias TextFieldMaskClosure = (String?) -> (String)

protocol TextFieldMasker {
    static var mask: TextFieldMaskClosure { get }
}
