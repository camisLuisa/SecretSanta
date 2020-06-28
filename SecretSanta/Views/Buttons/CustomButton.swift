import UIKit.UIButton

final class CustomButton: UIButton {
    
    // MARK: = Properties -
    let background: UIColor
    let titleColor: UIColor
    
    // MARK: - Setup View -
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = 20
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = background
            } else {
                backgroundColor = .gray
            }
        }
    }
    
    init(backgroundColor: UIColor, titleColor: UIColor) {
        self.background = backgroundColor
        self.titleColor = titleColor
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
