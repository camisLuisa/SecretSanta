import UIKit

final class AddParticipantView: UIView, UITextFieldDelegate {
    
    // MARK: - Properties -
    var didTapConfirmButton: (() -> Void)?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.8
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
        title.text = L10n.addParticipantsTitle
        title.font = UIFont(font: FontFamily.SegoeUI.bold, size: 27)
        title.textColor = .white
        title.textAlignment = .center
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 2
        return title
    }()
    
    private let nameInputView: FormInputView = {
       let input = FormInputView(type: FormInputViewType.participantName)
        return input
    }()
    
    private let emailInputView: FormInputView = {
        let input = FormInputView(type: FormInputViewType.participantEmail)
        return input
    }()
    
    private let button: CustomButton = {
        let button = CustomButton(backgroundColor: UIColor.white)
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
//        alertView.addSubview(emailInputView)
//        alertView.addSubview(button)
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
    }
    
    
}
