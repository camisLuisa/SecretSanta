import UIKit.UITextField

final class ParticipantTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tintColor = ColorName.red1.color
        
        configureWhiteInputView(backgroundColor: UIColor.white)
        autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
