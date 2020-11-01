import UIKit

final class GroupView: UIView {
    
    // MARK: - Properties -
    var didSelectAddGroup: (() -> Void)?
    
    private let contentView: UIView = {
       let contentView = UIView()
        contentView.backgroundColor = ColorName.gray2.color
        return contentView
    }()
    
    private let topContentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.white1.color
        view.layer.cornerRadius = 70
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        view.layer.shadowOpacity = 0.1
        return view
    }()

    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 71/2
        imageView.clipsToBounds = true
        imageView.layer.borderColor = ColorName.red3.color.cgColor
        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Grupos"
        label.textColor = ColorName.gray3.color
        label.font = UIFont.init(font: FontFamily.Quicksand.medium, size: 22)
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Asset.add.image, for: .normal)
        return button
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - init -
    init() {
        super.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        userImageView.image = UIImage.init(asset: ImageAsset(name: "lu"))
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableViewDelegate -
extension GroupView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! GroupTableViewCell
        cell.contentCell.backgroundColor = ColorName.red2.color
    }
}

// MARK: - SetupView -
extension GroupView {
    func setupTableView() {
        tableView.register(GroupTableViewCell.self, forCellReuseIdentifier: "groupCell")
    }
}

// MARK: - Actions -
extension GroupView {
    @objc
    func didTapAtAddGroup() {
        self.didSelectAddGroup?()
    }
}

// MARK: - TableView

// MARK: - CodeView -
extension GroupView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(topContentView)
        topContentView.addSubview(userImageView)
        topContentView.addSubview(titleLabel)
        topContentView.addSubview(addButton)
    }

    func setupContraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false

        topContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -20).isActive = true
        topContentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topContentView.heightAnchor.constraint(equalToConstant: 225).isActive = true
        topContentView.translatesAutoresizingMaskIntoConstraints = false

        userImageView.topAnchor.constraint(equalTo: topContentView.topAnchor, constant: 70).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor, constant: 20).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 71).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 71).isActive = true
        userImageView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor, constant: 50).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        addButton.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -35).isActive = true
        addButton.trailingAnchor.constraint(equalTo: topContentView.trailingAnchor, constant: -50).isActive = true
        addButton.translatesAutoresizingMaskIntoConstraints = false
    }
}
