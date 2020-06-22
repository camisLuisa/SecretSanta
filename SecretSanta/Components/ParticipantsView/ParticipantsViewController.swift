import UIKit

final class ParticipantsViewController: UIViewController {
    
    // MARK: - Attributes -
    private let participantsView: ParticipantsView
    private let coordinator: CreateGroupCoordinator
    
    // MARK: - Init -
    init(coordinator: CreateGroupCoordinator) {
        self.participantsView = ParticipantsView()
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        view = participantsView
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        participantsView.didSelectAddParticipants = {
            self.coordinator.goToCreateGroup()
        }
    }
}
