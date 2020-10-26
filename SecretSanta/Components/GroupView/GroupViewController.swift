import UIKit

final class GroupViewController: UIViewController {
    
    // MARK: - Attributes -
    private let viewGroup: GroupView
    private let coordinator: CreateGroupCoordinator
    
    // MARK: - Init -
    init(coordinator: CreateGroupCoordinator) {
        self.viewGroup = GroupView()
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        view = viewGroup
        super.viewDidLoad()

        viewGroup.didSelectAddGroup = {
            self.coordinator.goToCreateGroup()
        }
        
        viewGroup.setupTableView()
    }
}
