import UIKit

final class GroupTableViewCell: UITableViewCell {
    
    // MARK: - Attributes -
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
        
        contentView.layer.cornerRadius = 20.0
        contentView.backgroundColor = ColorName.red1.color
        backgroundColor = .clear
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GroupTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(groupName)
        contentView.addSubview(groupInfo)
        contentView.addSubview(groupNumber)
    }
    
    func setupContraints() {
        groupName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0).isActive = true
        groupName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        groupName.translatesAutoresizingMaskIntoConstraints = false
        
        groupInfo.topAnchor.constraint(equalTo: groupName.bottomAnchor).isActive = true
        groupInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        groupInfo.translatesAutoresizingMaskIntoConstraints = false
        
        groupNumber.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        groupNumber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        groupNumber.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
