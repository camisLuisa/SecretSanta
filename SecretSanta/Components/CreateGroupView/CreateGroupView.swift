import UIKit

enum CreateGroupViewType {
    case groupName
    case amount
    case eventDate
    
    var formInputViewType: FormInputViewType {
        switch self {
        case .groupName:
            return .groupName
        case .amount:
            return .amount
        case .eventDate:
            return .eventDate
        }
    }
}

final class CreateGroupView: UIView {
    // MARK: - Properties -
    var didTapAtCloseButton: (() -> Void)?
    var didTapAtNextButton: ((FormInputViewType) -> Void)?
    let type: CreateGroupViewType
    
    private lazy var validator: FieldValidator = {
        switch type {
        case .groupName:
            return GroupNameValidator()
        case .amount:
            return AmountValidator()
        case .eventDate:
            return EventDateValidator()
        }
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = ColorName.red1.color
        return contentView
    }()
    
    private let titleImageView: UIImageView = {
    let imageView = UIImageView(image: Asset.groupTitle.image)
    return imageView
    }()
    
    private let lineImageView: UIImageView = {
        let imageView = UIImageView(image: Asset.line.image)
    return imageView
    }()
    
    private lazy var whiteBox: WhiteBoxView = {
        let whiteBox = WhiteBoxView(type: self.type.formInputViewType)
        return whiteBox
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Asset.close.image, for: .normal)
        button.addTarget(self, action: #selector(didSelectCloseButton), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - init -
    init(type: CreateGroupViewType) {
        self.type = type
        
        super.init(frame: .zero)
        
        self.whiteBox.didTapNextButton = { type in
            self.didTapAtNextButton?(type)            
        }
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Actions -
extension CreateGroupView {
    @objc
    func didSelectCloseButton() {
        didTapAtCloseButton?()
    }
}

// MARK: - CodeView -
extension CreateGroupView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(titleImageView)
        contentView.addSubview(closeButton)
        contentView.addSubview(lineImageView)
        contentView.addSubview(whiteBox)
    }
    
    func setupContraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        titleImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        titleImageView.bottomAnchor.constraint(equalTo: lineImageView.topAnchor, constant: -5.0).isActive = true
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: lineImageView.topAnchor, constant: -5.0).isActive = true
        closeButton.translatesAutoresizingMaskIntoConstraints = false

        lineImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30.0).isActive = true
        lineImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30.0).isActive = true
        lineImageView.translatesAutoresizingMaskIntoConstraints = false

        whiteBox.topAnchor.constraint(equalTo: lineImageView.bottomAnchor, constant: 20.0).isActive = true
        whiteBox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0).isActive = true
        whiteBox.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
