//
//  CreateGroupType.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 22/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

enum FormInputViewType {
    case groupName
    case amount
    case eventDate
}

final class FormInputView: UIView {
    // MARK: - Properties
    private let type: FormInputViewType
    private weak var textFieldDelegate: UITextFieldDelegate?
    public private(set) var hasValidContent: Bool?
    
    // MARK: - Views -
    private let titleFieldLabel: UILabel = {
        let label  = UILabel()
        label.textColor = ColorName.red1.color
        label.font = UIFont(font: FontFamily.SegoeUI.bold, size: 25.0)
        return label
    }()
    
    lazy var formTextField: FormTextField = {
        let textField: FormTextField
        switch type {
        case .groupName:
            textField = BaseTextField(masker: AlphaNumericMasker.self)
            textField.keyboardType = .default
        case .amount:
            textField = AmountTextField(frame: .zero)
            textField.keyboardType = .numberPad
        case .eventDate:
            textField = EventDateTextField(frame: .zero)
            textField.keyboardType = .numberPad
        }
        
//        textField.font = UIFont()
        textField.textColor = .red
        textField.delegate = textFieldDelegate
        textField.addTarget(self, action: #selector(validateField), for: .editingChanged)
        
        return textField
    }()
    
    let validationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.SegoeUI.bold, size: 12.0)
        label.numberOfLines = 0
        return label
    }()
    
    var validator: FieldValidator {
        switch type {
        case .groupName:
            return GroupNameValidator()
        case .amount:
            return AmountValidator()
        case .eventDate:
            return EventDateValidator()
        }
    }
    
    init(frame: CGRect = .zero, type: FormInputViewType, delegate: UITextFieldDelegate? = nil) {
        self.type = type
        self.textFieldDelegate = delegate
        super.init(frame: frame)
        setupViews()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(formBecomeFirstResponder))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set ValidationLabel for type
private extension FormInputView {
    func setValidationLabel(forFieldError error: FieldError) {
        switch error {
        case .empty:
            setValidationLabelEmpty()
        case .incomplete:
            setValidationLabelIncomplete()
        case let .invalid(reason):
            setValidationLabelInvalid(reason: reason)
        }
    }
    
    func setValidationLabelEmpty() {
        validationLabel.textColor = .black
        switch type {
        case .groupName:
            validationLabel.text = "Digite o nome do grupo"
        case .amount:
            validationLabel.text = "Digite o valor sugerido para o presente."
        case .eventDate:
            validationLabel.text = "Digite a data do evento."
        }
    }
    
    func setValidationLabelIncomplete() {
        validationLabel.textColor = .blue
        switch type {
        case .groupName:
            validationLabel.text = "Digite o nome do grupo"
        case .amount:
            validationLabel.text = "Digite o valor sugerido para o presente."
        case .eventDate:
            validationLabel.text = "Formato dd/mm/aaaa"
        }
    }
    
    func setValidationLabelInvalid(reason: InvalidFieldReason) {
        validationLabel.isHidden = false
        validationLabel.textColor = .red
        switch type {
        case .groupName:
            validationLabel.text = ""
        case .amount:
            switch reason {
            case .wrongFormat:
                validationLabel.text = "Valor inferior ao permitido."
            default:
                validationLabel.text = ""
            }
        case .eventDate:
            switch reason {
            case .experiedDate:
                validationLabel.text = "Data do evento deve ser igual ou posterior ao dia de hoje."
            default:
                validationLabel.text = ""
            }
        }
    }
}

// MARK: - Set texts for type -
private extension FormInputView {
    func setupTexts() {
        switch type {
        case .groupName:
            setupTextsForGroupName()
        case .amount:
            setupTextsForAmount()
        case .eventDate:
            setupTextsForEventDate()
        }
    }
    
    func setupTextsForGroupName() {
        formTextField.placeholder = ""
        titleFieldLabel.text = "Nome do grupo"
    }
    
    func setupTextsForAmount() {
        formTextField.placeholder = ""
        titleFieldLabel.text = "Valor Mínimo"
    }
    
    func setupTextsForEventDate() {
        formTextField.placeholder = "dd/mm/aaaa"
        titleFieldLabel.text = "Data"
    }
}

// MARK: - Target -
private extension FormInputView {
    @objc
    func validateField() {
        switch validator.validation(text: formTextField.text) {
        case .success:
            hasValidContent = true
            validationLabel.text = ""
        case .failure(let error):
            hasValidContent = false
            setValidationLabel(forFieldError: error)
        }
    }
    
    @objc
    func formBecomeFirstResponder() {
        formTextField.becomeFirstResponder()
    }
}

// MARK: - CodeView -
extension FormInputView: CodeView {
    func buildViewHierarchy() {
        addSubview(titleFieldLabel)
        addSubview(formTextField)
        addSubview(validationLabel)
    }
    
    func setupContraints() {
        titleFieldLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleFieldLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleFieldLabel.translatesAutoresizingMaskIntoConstraints = false

        formTextField.topAnchor.constraint(equalTo: titleFieldLabel.bottomAnchor, constant: 40.0).isActive = true
        formTextField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        formTextField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        formTextField.translatesAutoresizingMaskIntoConstraints = false

        validationLabel.topAnchor.constraint(equalTo: formTextField.bottomAnchor).isActive = true
        validationLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        validationLabel.trailingAnchor.constraint(equalTo: formTextField.trailingAnchor).isActive = true
        validationLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupAdditionalConfiguration() {
        setupTexts()
    }
}

