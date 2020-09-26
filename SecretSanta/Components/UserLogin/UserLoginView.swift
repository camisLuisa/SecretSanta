import UIKit

final class UserLoginView: UIView {
    
    // MARK: - Attributes
    var didTapEnterButton: ((String, String) -> Void)?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Entre Agora"
        label.font = UIFont.init(font: FontFamily.Quicksand.medium, size: 24)
        label.textColor = UIColor.white
        return label
    }()
    
    private let inputEmail: CustomTextField = {
        let textfield = CustomTextField(frame: .zero)
        textfield.attributedPlaceholder = NSAttributedString(string: "E-mail",
                                                             attributes: [NSAttributedString.Key.foregroundColor: ColorName.roseRed.color])
        return textfield
    }()
    
    private let inputPassword: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Password"
        return textfield
    }()
    
    private let loginButton: CustomButton = {
        let button = CustomButton(backgroundColor: .white, titleColor: ColorName.red1.color)
        button.addTarget(self, action: #selector(didTapAtEnterButton), for: .touchUpInside)
        button.setTitle("Entrar", for: .normal)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()

    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Esqueci minha senha", for: .normal)
        button.titleLabel?.font = UIFont(font: FontFamily.Roboto.regular, size: 12)
        return button
    }()
    
    private let orEnterWithTitle: UILabel = {
       let label = UILabel()
        label.text = "Ou entre com:"
        label.font = UIFont(font: FontFamily.Quicksand.medium, size: 14)
        return label
    }()

    private let loginWithGoogleButton: CustomButton = {
        let button = CustomButton(backgroundColor: ColorName.mediumRed.color, titleColor: .white)
        button.setTitle("Entrar com o Google", for: .normal)
        return button
    }()

    private let loginWithFacebookButton: CustomButton = {
        let button = CustomButton(backgroundColor: ColorName.mediumRed.color, titleColor: .white)
        button.setTitle("Entrar com o Facebook", for: .normal)
        return button
    }()
    
    private let askLabel: UILabel = {
        let label = UILabel()
        label.text = "Não possui login?"
        return label
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        let attributedString = NSAttributedString(string: "Crie sua conta", attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16.0),
            NSAttributedString.Key.foregroundColor : UIColor.gray,
            NSAttributedString.Key.underlineStyle: 1.0
        ])
        
        button.setAttributedTitle(attributedString, for: .normal)
        return button
    }()

    // MARK: - init
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Action
private extension UserLoginView {
    @objc
    func didTapAtEnterButton() {
        self.didTapEnterButton?(inputEmail.text!, inputPassword.text!)
    }
}

// MARK: - CodeView
extension UserLoginView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        addSubview(titleLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(inputEmail)
//        stackView.addArrangedSubview(inputPassword)
//        stackView.addArrangedSubview(loginButton)
    }
    
    func setupContraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        inputEmail.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        inputEmail.widthAnchor.constraint(equalToConstant: 276).isActive = true
        inputEmail.translatesAutoresizingMaskIntoConstraints = false
//
//        inputPassword.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
//        inputPassword.widthAnchor.constraint(equalToConstant: 276).isActive = true
//        inputPassword.translatesAutoresizingMaskIntoConstraints = false
//
//        loginButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
//        loginButton.widthAnchor.constraint(equalToConstant: 276).isActive = true
//        loginButton.translatesAutoresizingMaskIntoConstraints = false
//
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24.0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}
