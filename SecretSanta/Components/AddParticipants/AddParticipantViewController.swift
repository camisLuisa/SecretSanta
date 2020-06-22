import UIKit

final class AddParticipantViewController: UIViewController {
    
    // MARK: - Attributes -
    private let addParticipantsView: AddParticipantView

    
    // MARK: - init -
    init() {
        self.addParticipantsView = AddParticipantView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        self.view = addParticipantsView
        super.viewDidLoad()
    }
}
