//
//  WhiteBoxView.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 11/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class WhiteBoxView: UIView, UITextFieldDelegate {
    
    // MARK: - Properties -
    private let type: FormInputViewType
    
    var didTapNextButton: ((FormInputViewType) -> Void)?
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.layer.cornerRadius = 26
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private lazy var stepImageView: UIImageView = {
        var stepImageView = UIImageView()
        switch type {
        case .groupName:
            stepImageView.image = Asset.step1.image
        case .amount:
            stepImageView.image = Asset.step2.image
        case .eventDate:
            stepImageView.image = Asset.step3.image
        }
        
        return stepImageView
    }()
    
    private lazy var datePickView: UIDatePicker = {
        let datePicker = UIDatePicker()
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            // Fallback on earlier versions
        }
        return datePicker
        
    }()
    
    private let nextButton: CustomButton = {
        let button = CustomButton(backgroundColor: ColorName.red1.color, titleColor: .white)
        button.setTitle("Próximo", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(didTapAtNextButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var forminputView: FormInputView = {
        let input = FormInputView(frame: .zero, type: self.type, delegate: self)
        input.delegate = self
        return input
    }()
    
    // MARK: - init -
    init(type: FormInputViewType) {
        self.type = type
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Actions -
extension WhiteBoxView {
    @objc
    func didTapAtNextButton() {
        self.didTapNextButton?(type)
    }
}

// MARK: - FormInputViewDelegate -
extension WhiteBoxView: FormInputViewDelegate {
    func validateInput(validatorStatus: ValidatorResponse) {
        switch validatorStatus {
        case .success:
            nextButton.isEnabled = true
        default:
            nextButton.isEnabled = false
        }
    }
    
    
}

// MARK: - CodeView -
extension WhiteBoxView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(stepImageView)
        if type == .eventDate {
            contentView.addSubview(datePickView)
        } else {
            contentView.addSubview(forminputView)
        }
        contentView.addSubview(nextButton)
    }
    
    func setupContraints() {
        contentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 325.0).isActive = true
        if type == .eventDate {
            contentView.heightAnchor.constraint(equalToConstant: 510.0).isActive = true
        } else {
            contentView.heightAnchor.constraint(equalToConstant: 303.0).isActive = true
        }
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        stepImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 33.0).isActive = true
        stepImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stepImageView.translatesAutoresizingMaskIntoConstraints = false
        
        if type == .eventDate {
            datePickView.topAnchor.constraint(equalTo: stepImageView.bottomAnchor, constant: 10).isActive = true
            datePickView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            datePickView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
            datePickView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
            datePickView.heightAnchor.constraint(equalToConstant: 310.0).isActive = true
            datePickView.translatesAutoresizingMaskIntoConstraints = false
        } else {
            forminputView.topAnchor.constraint(equalTo: stepImageView.bottomAnchor, constant: 10).isActive = true
            forminputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            forminputView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
            forminputView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
            forminputView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
            forminputView.translatesAutoresizingMaskIntoConstraints = false
        }

        nextButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -33).isActive = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false
    }    
}
