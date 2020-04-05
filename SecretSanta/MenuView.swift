import UIKit

final class MenuView: UIView {
    
    // MARK: - Parameters
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = UIColor.blue
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "OI o/"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup
extension MenuView: CodeView {
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(label)
    }
    
    func setupContraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            scrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: frame.height * 1.5).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -250).isActive = true
//        contentView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    

    
//    func setupView() {
//        addSubview(scrollView)
//        scrollView.addSubview(contentView)
//    }
//
//    func setupContraints() {
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//
//        if #available(iOS 11.0, *) {
//            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
//            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
//            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
//
//        } else {
//            scrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
//            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//            scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
//        }
//
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20.0).isActive = true
//        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20.0).isActive = true
//        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20.0).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20.0).isActive = true
//        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
//        contentView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
//    }
}
