//
//  EventDateTextField.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 01/05/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit.UITextField

final class EventDateTextField: FormTextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(didChangeAction), for: .editingChanged)
        autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didChangeAction() {
        self.text = EventDateMasker.mask(self.text)
    }
}
