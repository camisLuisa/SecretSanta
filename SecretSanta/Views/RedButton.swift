//
//  RedButton.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 09/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit.UIButton

final class RedButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setTitleColor(.white, for: .normal)
//        setTitleColor(.gray, for: .disabled)
        layer.cornerRadius = 20
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = ColorName.red1.color
            } else {
                backgroundColor = .gray
            }
        }
    }
}


