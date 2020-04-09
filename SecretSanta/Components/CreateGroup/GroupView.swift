//
//  GroupView.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 08/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class GroupView: UIView {
    
    // MARK: - Properties -
    private let contentView: UIView = {
       let contentView = UIView()
        contentView.backgroundColor = UIColor.white
        return contentView
    }()
    
    private let instructionLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.instructions
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - init -
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodeView -
extension GroupView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(instructionLabel)
    }
    
    func setupContraints() {
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        instructionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60).isActive = true
        instructionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
//        instructionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
}
