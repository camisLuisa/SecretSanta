import UIKit.UITextField

class CustomTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 25, bottom: 5, right: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = ColorName.roseRed.color
        textColor = ColorName.roseRed.color
        configureVisualFrameInputView()
        addTarget(self, action: #selector(editingChange), for: .editingChanged)
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(didEnd), for: .editingDidEnd)
        autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
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
