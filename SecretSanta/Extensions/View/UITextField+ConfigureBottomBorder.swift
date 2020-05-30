//
//  UITextField+ConfigureBottomBorder.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 28/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit.UITextField

extension UITextField {
    func configureBottomBorder(backgroundColor: UIColor, borderColor: UIColor) {
        self.borderStyle = .none
        layer.backgroundColor = backgroundColor.cgColor
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        layer.shadowColor = borderColor.cgColor
    }
}
