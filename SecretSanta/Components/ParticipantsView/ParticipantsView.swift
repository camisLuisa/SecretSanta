import UIKit

final class ParticipantsView: UIView {
    
    // MARK: - Properties -
    var didSelectAddParticipants: (() -> Void)?
    
    private let contentView: UIView = {
       let contentView = UIView()
        contentView.backgroundColor = UIColor.white
        return contentView
    }()
    
    private let topContentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.participantsScreenTitle
        label.font = UIFont(font: FontFamily.SegoeUI.bold, size: 24.0)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    private let addGroupButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Asset.plus.image, for: .normal)
        button.addTarget(self, action: #selector(didTapAtAddParticipants), for: .touchUpInside)
        return button
    }()
    
    private lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.instructions
        label.font = UIFont(font: FontFamily.SegoeUI.regular, size: 17.0)
        label.textColor = ColorName.gray1.color
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
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

// MARK: - Actions -
extension ParticipantsView {
    @objc
    func didTapAtAddParticipants() {
        self.didSelectAddParticipants?()
    }
}

// MARK: - Setup Info -
extension ParticipantsView {
    func setupInfo(date: String, amount: Double) {
        self.instructionLabel.text = "Data: \(date) \n Valor Mínimo: R$ \(amount)"
    }
}

// MARK: - CodeView -
extension ParticipantsView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(topContentView)
        topContentView.addSubview(titleLabel)
        topContentView.addSubview(addGroupButton)
        contentView.addSubview(instructionLabel)
    }
    
    func setupContraints() {
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        topContentView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        topContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topContentView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor, constant: 20.0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -10.0).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addGroupButton.topAnchor.constraint(equalTo: topContentView.topAnchor).isActive = true
        addGroupButton.trailingAnchor.constraint(equalTo: topContentView.trailingAnchor, constant: -40.0).isActive = true
        addGroupButton.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -10.0).isActive = true
        addGroupButton.translatesAutoresizingMaskIntoConstraints = false
        
        instructionLabel.topAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: 20).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60).isActive = true
        instructionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
