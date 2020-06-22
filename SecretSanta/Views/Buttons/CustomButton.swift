import UIKit.UIButton

final class CustomButton: UIButton {
    
    // MARK: = Properties -
    let background: UIColor
    
    // MARK: - Setup View -
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setTitleColor(.white, for: .normal)
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
    
    init(backgroundColor: UIColor) {
        self.background = backgroundColor
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
