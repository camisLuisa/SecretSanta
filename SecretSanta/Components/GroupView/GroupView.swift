import UIKit

final class GroupView: UIView {
    
    // MARK: - Properties -
    var viewModel: GroupViewModel?
    var deletePosition: Int?
    var createGroupDelegate: GroupViewDelegate?
    
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

    private lazy var userImageView: UIImageView = {
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
        button.addTarget(self, action: #selector(didTapAtAddGroup), for: .touchUpInside)
        return button
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Asset.delete.image, for: .normal)
        button.addTarget(self, action: #selector(didTapAtDeleteGroup), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        return tableView
    }()
    
    let instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Toque no + para criar um novo grupo de Amigo Secreto"
        label.font = UIFont.init(font: FontFamily.Quicksand.medium, size: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()

    private let giftIcon: UIImageView = {
        let img = UIImageView(image: Asset.gift.image)
        return img
    }()
    
    private let cancelButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setImage(Asset.cancelRed.image, for: .normal)
        button.addTarget(self, action: #selector(cancelDeletButton), for: .touchUpInside)
        button.isHidden = true
        return button
    }()

    // MARK: - init -
    init() {
        super.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableViewDelegate -
extension GroupView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userImageView.image = UIImage.init(asset: ImageAsset(name: "lu"))
        if viewModel?.friendsGroups.count ?? 0 > 0 {
            instructionsLabel.isHidden = true
        } else {
            instructionsLabel.isHidden = false
        }
        
        return viewModel?.friendsGroups.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendGroupTableViewCell", for: indexPath) as? FriendGroupTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FriendGroupTableViewCell else { return }
    }
}

// MARK: - SetupView -
extension GroupView {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let cell = UINib(nibName: "FriendGroupTableViewCell",
                                  bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "FriendGroupTableViewCell")
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(sender:)))
        tableView.addGestureRecognizer(longPress)

    }
    
    @objc
    func longPress(sender: UILongPressGestureRecognizer) {
        print(sender.state.rawValue)
        if sender.state == UIGestureRecognizer.State.began {
            let touchPoint = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                // your code here, get the row for the indexPath or do whatever you want
                print(indexPath)
                
                deleteButton.isHidden = false
                addButton.isHidden = true
                cancelButton.isHidden = false
                titleLabel.isHidden = true
                deletePosition = indexPath.item
            }
        }
    }
}

// MARK: - Actions -
extension GroupView {
    @objc
    func didTapAtAddGroup() {
        self.createGroupDelegate?.addFriendGroup()
    }
    
    @objc
    func didTapAtDeleteGroup() {
        guard let position = deletePosition else {
            return
        }
        self.createGroupDelegate?.deleteFriendGroup(position: position)
        deleteButton.isHidden = true
        addButton.isHidden = false
        cancelButton.isHidden = true
        titleLabel.isHidden = false
    }
    
    @objc
    func cancelDeletButton() {
        deleteButton.isHidden = true
        addButton.isHidden = false
        cancelButton.isHidden = true
        titleLabel.isHidden = false
    }
}

// MARK: - CodeView -
extension GroupView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(topContentView)
        topContentView.addSubview(userImageView)
        topContentView.addSubview(titleLabel)
        topContentView.addSubview(addButton)
        topContentView.addSubview(cancelButton)
        topContentView.addSubview(deleteButton)
        contentView.addSubview(tableView)
        tableView.addSubview(instructionsLabel)
        tableView.addSubview(giftIcon)
    }

    func setupContraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false

        topContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -70).isActive = true
        topContentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topContentView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        topContentView.translatesAutoresizingMaskIntoConstraints = false

        userImageView.topAnchor.constraint(equalTo: topContentView.topAnchor, constant: 120).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor, constant: 20).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 71).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 71).isActive = true
        userImageView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor, constant: 50).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cancelButton.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -30).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor, constant: 50).isActive = true
        cancelButton.translatesAutoresizingMaskIntoConstraints = false

        addButton.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -35).isActive = true
        addButton.trailingAnchor.constraint(equalTo: topContentView.trailingAnchor, constant: -50).isActive = true
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        deleteButton.bottomAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: -35).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: topContentView.trailingAnchor, constant: -50).isActive = true
        deleteButton.translatesAutoresizingMaskIntoConstraints = false

        tableView.topAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false

        instructionsLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        instructionsLabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 120).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 80).isActive = true
        instructionsLabel.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -80).isActive = true
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false

        giftIcon.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        giftIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        giftIcon.translatesAutoresizingMaskIntoConstraints = false
    }
}
