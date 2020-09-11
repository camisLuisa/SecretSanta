import UIKit.UITextField

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .white
        textColor = .white
        configureRedFrameInputView()
        addTarget(self, action: #selector(editingChange), for: .editingChanged)
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(didEnd), for: .editingDidEnd)
        autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTextField {
    @objc
    func editingChange() {
        
    }
    
    @objc
    func editingDidBegin() {
        
    }
    
    @objc
    func didEnd() {
        
    }
}
