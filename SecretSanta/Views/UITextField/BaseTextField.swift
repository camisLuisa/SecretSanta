//
//  SimpleTextField.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 01/05/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class BaseTextField: FormTextField {
    private let maxLength: Int?
    private let masker: TextFieldMasker.Type?
    
    init(frame: CGRect = .zero, maxLength: Int? = nil, masker: TextFieldMasker.Type? = nil) {
        self.maxLength = maxLength
        self.masker = masker
//        self.addTarget(self, action: #selector(textDidChange), for: .editingDidEnd)
//        autocorrectionType = .no
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func textDidChange(textField: UITextField) {
        guard var text = textField.text else { return }
        
        if let masker = masker {
            text = masker.mask(text)
            self.text = text
        }
        
        guard let max = maxLength, text.count > max else {
            return
        }
        
        text.removeLast()
        self.text = text
    }
}
