import UIKit

final class AddParticipantView: UIView {
    
    // MARK: - Properties -
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let AlertView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.red1.color
        return view
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = L10n.addParticipantsTitle
        title.font = UIFont(font: FontFamily.SegoeUI.bold, size: 27)
        title.textColor = .white
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 2
        return title
    }()
        
    // MARK: - init -
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
