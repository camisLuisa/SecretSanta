import UIKit

enum ParticipantInputViewType {
    case participantName
    case participantEmail
}

final class ParticipantInputView: UIView {
    // MARK: - Properties
    private let type: ParticipantInputViewType
    private weak var textFieldDelegate: UITextFieldDelegate?
    public private(set) var hasValidContent: Bool?
    
    // MARK: - Views -
    private let titleFieldLabel: UILabel = {
        let label  = UILabel()
        label.textColor = ColorName.red1.color
        label.font = UIFont(font: FontFamily.SegoeUI.bold, size: 25.0)
        return label
    }()
    
    lazy var participantTextField: ParticipantTextField = {
        let textfield: ParticipantTextField
        switch type {
        case .participantName:
            textfield = ParticipantTextField(frame: .zero)
        case .participantEmail:
            textfield = ParticipantTextField(frame: .zero)
        }
        
        textfield.font = UIFont(font: FontFamily.SegoeUI.bold, size: 12.0)
        textfield.textColor = .white
        textfield.delegate = textFieldDelegate
        
        return textfield
    }()
    
    let validationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.SegoeUI.bold, size: 12.0)
        label.numberOfLines = 0
        return label
    }()
    
    var validator: FieldValidator {
        switch type {
        case .participantName:
            return GroupNameValidator()
        case .participantEmail:
            return AmountValidator()
        }
    }
    
    init(frame: CGRect = .zero, type: ParticipantInputViewType, delegate: UITextFieldDelegate? = nil) {
        self.type = type
        self.textFieldDelegate = delegate
        super.init(frame: frame)
        setupViews()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(formBecomeFirstResponder))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set ValidationLabel for type
private extension ParticipantInputView {
    func setValidationLabel(forFieldError error: FieldError) {
        switch error {
        case .empty:
            setValidationLabelEmpty()
        case .incomplete:
            setValidationLabelIncomplete()
        case let .invalid(reason):
            setValidationLabelInvalid(reason: reason)
        }
    }
    
    func setValidationLabelEmpty() {
        validationLabel.textColor = .black
        switch type {
        case .participantName:
            validationLabel.text = "Digite o nome do participante."
        case .participantEmail:
            validationLabel.text = "Digite o email do participante."
        }
    }
    
    func setValidationLabelIncomplete() {
        validationLabel.textColor = .blue
        switch type {
        case .participantName:
            validationLabel.text = "Digite o nome do participante."
        case .participantEmail:
            validationLabel.text = "Digite o email do participante."
        }
    }
    
    func setValidationLabelInvalid(reason: InvalidFieldReason) {
        validationLabel.isHidden = false
        validationLabel.textColor = .red
        switch type {
        case .participantName:
            validationLabel.text = ""
        case .participantEmail:
            switch reason {
            case .wrongFormat:
                validationLabel.text = "Valor inferior ao permitido."
            default:
                validationLabel.text = ""
            }
        }
    }
}

// MARK: - Set texts for type -
private extension ParticipantInputView {
    func setupTexts() {
        switch type {
        case .participantName:
            setupTextsForParticipantName()
        case .participantEmail:
            setupTextsForParticipantEmail()
        }
    }
    
    func setupTextsForParticipantName() {
        participantTextField.placeholder = "Nome"
    }
    
    func setupTextsForParticipantEmail() {
        participantTextField.placeholder = "E-mail"
    }
}

// MARK: - Target -
private extension ParticipantInputView {
    @objc
    func validateField() {
        switch validator.validation(text: participantTextField.text) {
        case .success:
            hasValidContent = true
            validationLabel.text = ""
        case .failure(let error):
            hasValidContent = false
            setValidationLabel(forFieldError: error)
        }
    }
    
    @objc
    func formBecomeFirstResponder() {
        participantTextField.becomeFirstResponder()
    }
}

// MARK: - CodeView -
extension ParticipantInputView: CodeView {
    func buildViewHierarchy() {
        addSubview(titleFieldLabel)
        addSubview(participantTextField)
        addSubview(validationLabel)
    }
    
    func setupContraints() {
        titleFieldLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleFieldLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleFieldLabel.translatesAutoresizingMaskIntoConstraints = false

        participantTextField.topAnchor.constraint(equalTo: titleFieldLabel.bottomAnchor, constant: 40.0).isActive = true
        participantTextField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        participantTextField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        participantTextField.translatesAutoresizingMaskIntoConstraints = false

        validationLabel.topAnchor.constraint(equalTo: participantTextField.bottomAnchor).isActive = true
        validationLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        validationLabel.trailingAnchor.constraint(equalTo: participantTextField.trailingAnchor).isActive = true
        validationLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupAdditionalConfiguration() {
        setupTexts()
    }
}

