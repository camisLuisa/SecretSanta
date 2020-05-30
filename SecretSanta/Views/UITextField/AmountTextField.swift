//
//  AmountTextField.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 28/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit.UITextField

final class AmountTextField: FormTextField {
    enum BottomBorder {
        case alwaysShow
        case showWhenEditing
    }
    
    var bottomBorderState : BottomBorder = .alwaysShow {
        didSet {
            switch bottomBorderState {
            case .alwaysShow:
                rightView = nil
                rightViewMode = .never
            case .showWhenEditing:
                rightView = editorImage
                rightViewMode = .always
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            editorImage.tintColor = isEnabled ? Color.red : Color.gray
        }
    }
    
    private let editorImage: UIImageView = {
        let imageView = UIImageView(image: Asset.plus.image.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = Color.red
        return imageView
    }()
    
    override init(bottomBorder: Bool) {
        super.init(bottomBorder: bottomBorder)
        addTarget(self, action: #selector(editingChange), for: .editingChanged)
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(editingChange), for: .editingChanged)
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
        autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AmountTextField {
    @objc
    func editingChange() {
        let text = NSMutableAttributedString(string: "R$ ", attributes: [.font: UIFont(font: FontFamily.SegoeUI.regular, size: 3.0)])
        self.attributedText = text
    }
    
    @objc
    func editingDidBegin() {
        switch bottomBorderState {
        case .alwaysShow:
            break
        case .showWhenEditing:
            rightView?.isHidden = true
            addBottomBorder()
        }
    }
    
    @objc
    func editingDidEnd() {
        switch bottomBorderState {
        case .alwaysShow:
            break
        case .showWhenEditing:
            rightView?.isHidden = false
            removeBottomBorder()
        }
    }
    
    private func addBottomBorder() {
        configureBottomBorder(backgroundColor: backgroundColor ?? .clear, borderColor: .gray)
    }
    
    private func removeBottomBorder() {
        configureBottomBorder(backgroundColor: backgroundColor ?? .clear, borderColor: .clear)
    }
}
