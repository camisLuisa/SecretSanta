import UIKit.UIButton

final class CustomButton: UIButton {
    
    // MARK: - Properties -
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
            backgroundColor = isEnabled ? background : ColorName.gray4.color
        }
    }
    
    override public var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? ColorName.gray4.color : background
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
