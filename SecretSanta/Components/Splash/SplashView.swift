//
//  SplashView.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 05/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

class SplashView: UIView {
    
    // MARK: - Properties
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let logoView: UIImageView = {
        let image = UIImageView(image: Asset.logoSecretSanta.image)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: - init
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SplashView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(logoView)
    }
    
    func setupContraints() {
        
        contentView.translatesAutoresizingMaskIntoConstraints = false

//        if #available(iOS 11.0, *) {
//            contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
//            contentView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
//            contentView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
//            contentView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        } else {
//            contentView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
//            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//            contentView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
//        }
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        contentView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        

        logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        logoView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -200).isActive = true
        logoView.translatesAutoresizingMaskIntoConstraints = false
    }
}
