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
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Grupos"
        return label
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
    }

    func setupContraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false

        topContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -75).isActive = true
        topContentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topContentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        topContentView.translatesAutoresizingMaskIntoConstraints = false
    }
}
