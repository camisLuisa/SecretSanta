//
//  AmountTextField.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 26/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit.UITextField

class FormTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    init(bottomBorder: Bool = true) {
        super.init(frame: .zero)
        tintColor = .black
        if bottomBorder {
            configureBottomBorder(backgroundColor: backgroundColor ?? .clear, borderColor: .lightGray)
            addTarget(self, action: #selector(didBegin), for: .editingDidBegin)
            addTarget(self, action: #selector(didEnd), for: .editingDidEnd)
            autocorrectionType = .no
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .gray
        configureBottomBorder(backgroundColor: backgroundColor ?? .clear, borderColor: .lightGray)
        addTarget(self, action: #selector(didBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(didEnd), for: .editingDidEnd)
        autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    @objc
    private func didBegin() {
        configureBottomBorder(backgroundColor: backgroundColor ?? .clear, borderColor: .blue)
    }
    
    @objc
    private func didEnd() {
        configureBottomBorder(backgroundColor: backgroundColor ?? .clear, borderColor: .blue)
    }
}