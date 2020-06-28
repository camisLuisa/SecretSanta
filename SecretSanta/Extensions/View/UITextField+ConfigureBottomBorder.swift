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
    
    func configureWhiteInputView(backgroundColor: UIColor) {
        layer.cornerRadius = 13.0
        layer.masksToBounds = true
        layer.backgroundColor = backgroundColor.cgColor
    }
}
