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
    
    private let topContentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView(image: Asset.groupTitle.image)
        return imageView
    }()
    
    private let addGrouButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Asset.plus.image, for: .normal)
        return button
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
        contentView.addSubview(topContentView)
        topContentView.addSubview(titleImageView)
        topContentView.addSubview(addGrouButton)
        contentView.addSubview(instructionLabel)
    }
    
    func setupContraints() {
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        topContentView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        topContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topContentView.translatesAutoresizingMaskIntoConstraints = false
        
        titleImageView.topAnchor.constraint(equalTo: topContentView.topAnchor).isActive = true
        titleImageView.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor, constant: 20.0).isActive = true
        titleImageView.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -10.0).isActive = true
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addGrouButton.trailingAnchor.constraint(equalTo: topContentView.trailingAnchor, constant: -40.0).isActive = true
        addGrouButton.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -10.0).isActive = true
        addGrouButton.translatesAutoresizingMaskIntoConstraints = false
        
        instructionLabel.topAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: 20).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60).isActive = true
        instructionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
}
