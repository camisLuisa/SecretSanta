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

        participantsView.setupInfo(date: "12/08/2020", amount: 200.0)
        participantsView.didSelectAddParticipants = {
            self.coordinator.goToAddParticipants()
        }
    }
    
    override func loadView() {
        setupView()
    }
    
    // MARK: - Setup View -
    func setupView() {
        self.navigationItem.setHidesBackButton(false, animated: false)
        self.navigationController?.navigationBar.tintColor = .white
        
        let backButton = UIBarButtonItem()
        backButton.title = "Group 1"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
