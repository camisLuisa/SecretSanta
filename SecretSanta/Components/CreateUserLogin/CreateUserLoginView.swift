import UIKit

final class CreateUserLoginView: UIView {
    
    //MARK: - Attributes -
    var didTapEnterButton: ((String, String, String) -> Void)?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let titleLabel: UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = UIFont(font: FontFamily.SegoeUI.regular, size: 32.0)
        title.text = L10n.createUserLoginTitle
        return title
    }()
    
    private let inputName: CustomTextField = {
        let inputName = CustomTextField(frame: .zero)
        inputName.font = UIFont(font: FontFamily.SegoeUI.regular, size: 16.0)
        return inputName
    }()
    
    private let inputEmail: UITextView = {
        let inputEmail = UITextView()
        inputEmail.font = UIFont(font: FontFamily.SegoeUI.regular, size: 16.0)
        return inputEmail
    }()
    
    private let inputPassword: UITextView = {
        let inputPassword = UITextView()
        inputPassword.font = UIFont(font: FontFamily.SegoeUI.regular, size: 16.0)
        return inputPassword
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapAtEnterButton), for: .touchUpInside)
        button.setTitle("Criar Conta", for: .normal)
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
    
    // MARK: - init -
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Action
private extension CreateUserLoginView {
    @objc
    func didTapAtEnterButton() {
        self.didTapEnterButton?("", inputEmail.text, inputPassword.text)
    }
}

//MARK: - CodeView -
extension CreateUserLoginView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(titleLabel)
//        contentView.addSubview(inputName)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(inputName)
        stackView.addArrangedSubview(inputEmail)
        stackView.addArrangedSubview(inputPassword)
        contentView.addSubview(enterButton)
    }
    
    func setupContraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        inputName.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        inputName.widthAnchor.constraint(equalToConstant: 276).isActive = true
        inputName.translatesAutoresizingMaskIntoConstraints = false
        
        inputEmail.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        inputEmail.widthAnchor.constraint(equalToConstant: 276).isActive = true
        inputEmail.translatesAutoresizingMaskIntoConstraints = false
        
        inputPassword.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        inputPassword.widthAnchor.constraint(equalToConstant: 276).isActive = true
        inputPassword.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 46.0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        enterButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40.0).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        enterButton.translatesAutoresizingMaskIntoConstraints = false
    }
    

}
