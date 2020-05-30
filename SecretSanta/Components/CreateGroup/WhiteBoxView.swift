//
//  WhiteBoxView.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 11/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class WhiteBoxView: UIView, UITextFieldDelegate {
    private let type: FormInputViewType
    
    // MARK: - Properties
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.layer.cornerRadius = 26
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let nextButton: RedButton = {
        let button = RedButton()
        button.setTitle("Próximo", for: .normal)
        button.isEnabled = true
        return button
    }()
    
    private lazy var forminputView: FormInputView = {
        let input = FormInputView(frame: .zero, type: self.type, delegate: self)
        return input
    }()
    
//    private let stepView: UIView = {
//        
//    }
    
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

// MARK: - CodeView -
extension WhiteBoxView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(forminputView)
        contentView.addSubview(nextButton)
    }
    
    func setupContraints() {
        contentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 325.0).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 303.0).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        forminputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        forminputView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        forminputView.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        forminputView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        forminputView.translatesAutoresizingMaskIntoConstraints = false

        nextButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 159).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -33).isActive = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false
    }    
}
