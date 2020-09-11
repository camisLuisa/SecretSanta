import UIKit

final class CustomInputView: UIView {
    // MARK: = Properties
    private weak var textFieldDelegate: UITextFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var inputField: CustomTextField = {
        let textField = CustomTextField(frame: .zero)
        textField.backgroundColor = .yellow
        textField.delegate = textFieldDelegate
        return textField
    }()
    
    init(frame: CGRect, delegate: UITextFieldDelegate? = nil) {
        self.textFieldDelegate = delegate
        super.init(frame: frame)
        setupViews()
    }
}

extension CustomInputView: CodeView {
    func buildViewHierarchy() {
        addSubview(inputField)
    }
    
    func setupContraints() {
        inputField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        inputField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        inputField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        inputField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        inputField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .blue
    }
}
