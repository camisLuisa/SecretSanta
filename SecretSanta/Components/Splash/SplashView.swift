//
//  SplashView.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 05/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

class SplashView: UIView {
    
    // MARK: - Properties -
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let logoView: UIImageView = {
        let image = UIImageView(image: Asset.logoAmiguSecreto.image)
        image.contentMode = .scaleAspectFit
        return image
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

// MARK: - Codeview -
extension SplashView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(logoView)
    }
    
    func setupContraints() {
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        

        logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        logoView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -200).isActive = true
        logoView.translatesAutoresizingMaskIntoConstraints = false
    }
}
