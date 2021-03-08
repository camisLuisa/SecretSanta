import UIKit

final class UserLoginView: UIView {
    
    // MARK: - Attributes
    var didTapEnterButton: ((String, String) -> Void)?
    var didTapEnterWithGoogleButton: (() -> Void)?
    var didTapEnterWithFacebookButton: (() -> Void)?
    var didTapCreateAccountButton: (() -> Void)?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.enterNow
        label.font = UIFont.init(font: FontFamily.Quicksand.medium, size: 24)
        label.textColor = UIColor.white
        return label
    }()
    
//    private let inputEmail: CustomTextField = {
//        let textfield = CustomTextField(frame: .zero)
//        textfield.attributedPlaceholder = NSAttributedString(string: L10n.email,
//                                                             attributes: [NSAttributedString.Key.foregroundColor: ColorName.roseRed.color])
//        textfield.leftViewMode = .always
//        textfield.textColor = .white
//        let imgView = UIImageView(frame: CGRect(x: 0, y: 8.0, width: 20.0, height: 20.0))
//        imgView.image = Asset.idIcon.image
//
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
//        view.addSubview(imgView)
//        textfield.leftView = view
//        return textfield
//    }()
    
    private let inputEmail: LoginInputView = {
        let inputEmail = LoginInputView(type: .email)
        return inputEmail
    }()
    
    private let inputPassword: CustomTextField = {
        let textfield = CustomTextField()
        textfield.isSecureTextEntry = true
        textfield.attributedPlaceholder = NSAttributedString(string: L10n.password,
                                                             attributes: [.foregroundColor: ColorName.roseRed.color])
        textfield.leftViewMode = .always
        textfield.textColor = .white
        let imgView = UIImageView(frame: CGRect(x: 0, y: 8.0, width: 20.0, height: 20.0))
        imgView.image = Asset.passwordIcon.image
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        view.addSubview(imgView)
        textfield.leftView = view
        return textfield
    }()

    private let loginButton: CustomButton = {
        let button = CustomButton(backgroundColor: .white, titleColor: ColorName.red1.color)
        button.addTarget(self, action: #selector(didTapAtEnterButton), for: .touchUpInside)
        button.setTitle(L10n.enter, for: .normal)
        button.isEnabled = true
        return button
    }()

    private let stackViewOne: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 40
        return stackView
    }()

    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        let attributeString = NSMutableAttributedString(string: L10n.forgotPassword,
                                                        attributes: [
                                                            .font: UIFont.systemFont(ofSize: 14),
                                                            .foregroundColor: UIColor.white,
                                                            .underlineStyle: NSUnderlineStyle.single.rawValue])

        button.setAttributedTitle(attributeString, for: .normal)
        return button
    }()

    private let orEnterWithTitle: UILabel = {
       let label = UILabel()
        label.text = L10n.orLoginWith
        label.font = UIFont(font: FontFamily.Quicksand.medium, size: 14)
        label.textColor = UIColor.white
        return label
    }()

    private let loginWithGoogleButton: CustomButton = {
        let button = CustomButton(backgroundColor: ColorName.mediumRed.color, titleColor: .white)
        button.addTarget(self, action: #selector(didTapAtEnterWithGoogle), for: .touchUpInside)
        button.setTitle(L10n.enterWithGoogle, for: .normal)
        button.isEnabled = true
        return button
    }()

    private let loginWithFacebookButton: CustomButton = {
        let button = CustomButton(backgroundColor: ColorName.mediumRed.color, titleColor: .white)
        button.addTarget(self, action: #selector(didTapAtEnterWithFacebook), for: .touchUpInside)
        button.setTitle(L10n.enterWithFacebook, for: .normal)
        button.isEnabled = true
        return button
    }()

    private let stackViewTwo: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()

    private let askLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.dontHaveLogin
        label.textColor = .white
        return label
    }()

    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapAtCreateAccount), for: .touchUpInside)
        let attributeString = NSMutableAttributedString(string: L10n.createAccount, attributes: [
                                                            .font: UIFont.systemFont(ofSize: 16),
                                                            .foregroundColor: ColorName.appYellow.color,
                                                            .underlineStyle: NSUnderlineStyle.single.rawValue])

        button.setAttributedTitle(attributeString, for: .normal)
        return button
    }()
    
    private let stackViewThree: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
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
//        self.didTapEnterButton?(inputEmail.text!, inputPassword.text!)
    }
    
    @objc
    func didTapAtEnterWithGoogle() {
        self.didTapEnterWithGoogleButton?()
    }

    @objc
    func didTapAtEnterWithFacebook() {
        self.didTapEnterWithFacebookButton?()
    }

    @objc
    func didTapAtCreateAccount() {
        self.didTapCreateAccountButton?()
    }
}

// MARK: - CodeView
extension UserLoginView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        addSubview(titleLabel)
        addSubview(stackViewOne)
        stackViewOne.addArrangedSubview(inputEmail)
        stackViewOne.addArrangedSubview(inputPassword)
        stackViewOne.addArrangedSubview(loginButton)
        addSubview(forgotPasswordButton)
        addSubview(orEnterWithTitle)
        addSubview(stackViewTwo)
        stackViewTwo.addArrangedSubview(loginWithGoogleButton)
        stackViewTwo.addArrangedSubview(loginWithFacebookButton)
        addSubview(stackViewThree)
        stackViewThree.addArrangedSubview(askLabel)
        stackViewThree.addArrangedSubview(createAccountButton)
    }

    func setupContraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        inputEmail.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        inputEmail.widthAnchor.constraint(equalToConstant: 276).isActive = true
        inputEmail.translatesAutoresizingMaskIntoConstraints = false

        inputPassword.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        inputPassword.widthAnchor.constraint(equalToConstant: 276).isActive = true
        inputPassword.translatesAutoresizingMaskIntoConstraints = false

        loginButton.heightAnchor.constraint(equalToConstant: 43.0).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 276).isActive = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        stackViewOne.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24.0).isActive = true
        stackViewOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        stackViewOne.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        stackViewOne.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackViewOne.translatesAutoresizingMaskIntoConstraints = false

        forgotPasswordButton.topAnchor.constraint(equalTo: stackViewOne.bottomAnchor, constant: 10.0).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: stackViewOne.trailingAnchor).isActive = true
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false

        orEnterWithTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        orEnterWithTitle.bottomAnchor.constraint(equalTo: stackViewTwo.topAnchor, constant: -20.0).isActive = true
        orEnterWithTitle.translatesAutoresizingMaskIntoConstraints = false

        loginWithGoogleButton.heightAnchor.constraint(equalToConstant: 43.0).isActive = true
        loginWithGoogleButton.widthAnchor.constraint(equalToConstant: 276).isActive = true
        loginWithGoogleButton.translatesAutoresizingMaskIntoConstraints = false

        loginWithFacebookButton.heightAnchor.constraint(equalToConstant: 43.0).isActive = true
        loginWithFacebookButton.widthAnchor.constraint(equalToConstant: 276).isActive = true
        loginWithFacebookButton.translatesAutoresizingMaskIntoConstraints = false

        stackViewTwo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackViewTwo.bottomAnchor.constraint(equalTo: stackViewThree.topAnchor, constant: -40.0).isActive = true
        stackViewTwo.translatesAutoresizingMaskIntoConstraints = false

        askLabel.translatesAutoresizingMaskIntoConstraints = false

        createAccountButton.translatesAutoresizingMaskIntoConstraints = false

        stackViewThree.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackViewThree.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -35.0).isActive = true
        stackViewThree.translatesAutoresizingMaskIntoConstraints = false
    }
}
