import UIKit

final class AddParticipantView: UIView, UITextFieldDelegate {
    
    // MARK: - Properties -
    var didTapConfirmButton: (() -> Void)?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        return view
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        view.layer.cornerRadius = 15.0
        view.alpha = 1.0
        return view
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 2
        
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let attrString = NSMutableAttributedString(string: L10n.addParticipantsTitle, attributes: [.font: UIFont(font: FontFamily.SegoeUI.regular, size: 25)])
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:textStyle, range:NSMakeRange(0, attrString.length))
        title.attributedText = attrString
        return title
    }()
    
    private let nameInputView: UITextField = {
       let input = UITextField()
        input.backgroundColor = .white
        input.textColor = ColorName.red1.color
        input.placeholder = "Nome"
        input.layer.cornerRadius = 20.0
        return input
    }()

    private let emailInputView: UITextField = {
       let input = UITextField()
        input.backgroundColor = .white
        input.textColor = ColorName.red1.color
        input.placeholder = "E-mail"
        input.layer.cornerRadius = 20.0
        return input
    }()
    
    private let button: CustomButton = {
        let button = CustomButton(backgroundColor: UIColor.white, titleColor: ColorName.red1.color)
        button.setTitle("Confirmar", for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(didTapAtConfirm), for: .touchUpInside)
        return button
    }()

    // MARK: - init -
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddParticipantView {
    @objc
    func didTapAtConfirm() {
        self.didTapConfirmButton?()
    }
}

// MARK: - CodeView -
extension AddParticipantView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(nameInputView)
        alertView.addSubview(emailInputView)
        alertView.addSubview(button)
    }

    func setupContraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false

        alertView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        alertView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        alertView.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        alertView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 30.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -30.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 30.0).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        nameInputView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 30.0).isActive = true
        nameInputView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -30.0).isActive = true
        nameInputView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0).isActive = true
        nameInputView.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        nameInputView.translatesAutoresizingMaskIntoConstraints = false

        emailInputView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 30.0).isActive = true
        emailInputView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -30.0).isActive = true
        emailInputView.topAnchor.constraint(equalTo: nameInputView.bottomAnchor, constant: 10.0).isActive = true
        emailInputView.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        emailInputView.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: emailInputView.bottomAnchor, constant: 20.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 125.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
    }
}
