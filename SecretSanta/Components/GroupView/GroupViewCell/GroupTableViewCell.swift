import UIKit

final class GroupTableViewCell: UITableViewCell {
    
    // MARK: - Attributes -
    private let contentCell: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let contentInfo: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30.0
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let groupName: UILabel = {
        let groupName = UILabel()
        groupName.font = UIFont(font: FontFamily.SegoeUI.regular, size: 17.0)
        groupName.text = "Grupo 01"
        groupName.textColor = .white
        return groupName
    }()
    
    private let groupInfo: UILabel = {
        let groupInfo = UILabel()
        groupInfo.font = UIFont(font: FontFamily.SegoeUI.regular, size: 17.0)
        groupInfo.text = "4 Participantes"
        groupInfo.textColor = .white
        return groupInfo
    }()
    
    private let groupNumber: UILabel = {
        let groupNumber = UILabel()
        groupNumber.font = UIFont(font: FontFamily.SegoeUI.regular, size: 17.0)
        groupNumber.text = "12/12"
        groupNumber.textColor = .white
        return groupNumber
    }()
    
    // MARK: - Init -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GroupTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(contentCell)
        contentCell.addSubview(contentInfo)
        contentInfo.addSubview(groupName)
        contentInfo.addSubview(groupInfo)
        contentInfo.addSubview(groupNumber)
    }
    
    func setupContraints() {
        contentCell.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        contentCell.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        contentCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        contentCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        contentCell.translatesAutoresizingMaskIntoConstraints = false
        
        contentInfo.topAnchor.constraint(equalTo: contentCell.topAnchor).isActive = true
        contentInfo.widthAnchor.constraint(equalToConstant: 325).isActive = true
        contentInfo.centerXAnchor.constraint(equalTo: contentCell.centerXAnchor).isActive = true
        contentInfo.bottomAnchor.constraint(equalTo: contentCell.bottomAnchor).isActive = true
        contentInfo.translatesAutoresizingMaskIntoConstraints = false
        
        groupName.topAnchor.constraint(equalTo: contentInfo.topAnchor, constant: 5.0).isActive = true
        groupName.leadingAnchor.constraint(equalTo: contentInfo.leadingAnchor, constant: 10.0).isActive = true
        groupName.translatesAutoresizingMaskIntoConstraints = false

        groupInfo.topAnchor.constraint(equalTo: groupName.bottomAnchor).isActive = true
        groupInfo.leadingAnchor.constraint(equalTo: contentInfo.leadingAnchor, constant: 10.0).isActive = true
        groupInfo.translatesAutoresizingMaskIntoConstraints = false

        groupNumber.centerYAnchor.constraint(equalTo: contentInfo.centerYAnchor).isActive = true
        groupNumber.trailingAnchor.constraint(equalTo: contentInfo.trailingAnchor, constant: -10.0).isActive = true
        groupNumber.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
