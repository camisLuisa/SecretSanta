import UIKit.UITextField

class FormTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    init(bottomBorder: Bool = true) {
        super.init(frame: .zero)
        tintColor = .black
        if bottomBorder {
            autocorrectionType = .no
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .gray
        configureBottomBorder(backgroundColor: UIColor.white, borderColor: ColorName.red1.color)
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
}
