import UIKit

final class UserLoginView: UIView {
    
    // MARK: - Attributes
    var didTapEnterButton: ((String, String) -> Void)?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let inputEmail: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "E-mail"
        return textfield
    }()
    
    private let inputPassword: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Password"
        return textfield
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
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
    
    // MARK: - init
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Action
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
        addSubview(stackView)
        stackView.addArrangedSubview(inputEmail)
        stackView.addArrangedSubview(inputPassword)
        stackView.addArrangedSubview(loginButton)
    }
    
    func setupContraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        inputEmail.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        inputEmail.widthAnchor.constraint(equalToConstant: 276).isActive = true
        inputEmail.translatesAutoresizingMaskIntoConstraints = false
        
        inputPassword.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        inputPassword.widthAnchor.constraint(equalToConstant: 276).isActive = true
        inputPassword.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 276).isActive = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46.0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}
