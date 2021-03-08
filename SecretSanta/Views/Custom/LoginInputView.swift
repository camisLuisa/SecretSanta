//
//  LoginInputView.swift
//  SecretSanta
//
//  Created by Camila Luísa on 17/02/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

enum LoginInputViewType {
    case email
    case password
}

final class LoginInputView: UIView {
    
    // MARK: - Attributes
    private weak var textFieldDelegate: UITextFieldDelegate?
    private let type: LoginInputViewType
    var delegate: InputDelegate?
    
    private lazy var loginInput: CustomTextField = {
        let textfield = CustomTextField(frame: .zero)
        textfield.leftViewMode = .always
        textfield.textColor = .white
        let imgView = UIImageView(frame: CGRect(x: 0, y: 8.0, width: 20.0, height: 20.0))
        var textPlaceholder = L10n.email

        switch type {
        case .email:
            imgView.image = Asset.idIcon.image
        case .password:
            imgView.image = Asset.passwordIcon.image
            textfield.isSecureTextEntry = true
            textPlaceholder = L10n.password
        }

        textfield.attributedPlaceholder = NSAttributedString(string: L10n.email,
                                                             attributes: [NSAttributedString.Key.foregroundColor: ColorName.roseRed.color])

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        view.addSubview(imgView)
        textfield.leftView = view

        return textfield
    }()

    let validationLabel: UILabel = {
        let label = UILabel()
        label.text = "Vai funcionar com a graça do universo"
        label.textColor = .blue
        label.font = UIFont(font: FontFamily.Quicksand.regular, size: 12.0)
        label.numberOfLines = 0
        return label
    }()
    
    var validator: FieldValidator {
        switch type {
        case .email:
            return LoginEmailValidator()
        default:
            return LoginEmailValidator()
        }
    }
    
    init(frame: CGRect = .zero, type: LoginInputViewType, delegate: UITextFieldDelegate? = nil) {
        self.type = type
        self.textFieldDelegate = delegate
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set ValidationLabel For type
private extension LoginInputView {
    func setValidationLabel(forFieldError error: FieldError) {
        switch error {
        case .empty:
            setValidationLabelEmpty()
        case .tooShort:
            setValidationLabelTooShort()
        case .tooLong:
            setValidationLabelTooLong()
        default:
            print("TO DO")
        }
    }
    
    func setValidationLabelEmpty() {
        validationLabel.textColor = .black
        switch type {
        case .email:
            validationLabel.text = "Digite seu e-mail"
        case .password:
            validationLabel.text = "Digite sua senha"
        }
    }
    
    func setValidationLabelTooShort() {
        validationLabel.textColor = .black
        switch type {
        case .email:
            validationLabel.text = "E-mail muito curto"
        case .password:
            validationLabel.text = "Digite uma senha com mais de 6 caracteres"
        }
    }
    
    func setValidationLabelTooLong() {
        validationLabel.textColor = .black
        switch type {
        case .email:
            validationLabel.text = "E-mail muito longo"
        case .password:
            validationLabel.text = "Digite uma senha com menos de 8 caracteres"
        }
    }
    
    func setValidationLabelInvalid(reason: InvalidFieldReason) {
        validationLabel.textColor = .red
        switch type {
        case .email:
            switch reason {
            case .wrongFormat:
                validationLabel.text = "E-mail está com formato errado"
            default:
                validationLabel.text = ""
            }
        default:
            validationLabel.text = ""
        }
    }
}

// MARK: - Set Texts for type -
private extension LoginInputView {
    
}

// MARK: - CodeView
extension LoginInputView: CodeView {
    func buildViewHierarchy() {
        addSubview(loginInput)
        addSubview(validationLabel)
    }
    
    func setupContraints() {
        loginInput.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loginInput.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        loginInput.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        loginInput.translatesAutoresizingMaskIntoConstraints = false
        
        validationLabel.topAnchor.constraint(equalTo: loginInput.bottomAnchor, constant: 8).isActive = true
        validationLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        validationLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupAdditionalConfiguration() {
//        setupTexts()
    }
}
