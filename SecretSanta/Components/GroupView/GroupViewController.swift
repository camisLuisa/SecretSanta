import UIKit

final class GroupViewController: UIViewController {
    
    // MARK: - Attributes -
    let viewGroup: GroupView
    private let coordinator: CreateGroupCoordinator
    let viewModel = GroupViewModel()
    var friendGroup: FriendGroup?
    
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
        viewGroup.viewModel = viewModel
        viewGroup.createGroupDelegate = self
        super.viewDidLoad()
        
        viewGroup.setupTableView()
        
        if let friendGroup = friendGroup {
            do {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                let eventDate = formatter.date(from: "10/08/2021")

                try self.viewModel.addNewFriendGroup(element: FriendGroup(name: "Amigos", friends: [], minimumValue: 200.0, eventDate: eventDate!))
                self.viewGroup.tableView.reloadData()
            } catch {
                let alert = UIAlertController(title: "Ops!", message: "Não foi possível criar o grupo.", preferredStyle: .alert)
                let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension GroupViewController: GroupViewDelegate {
    func addFriendGroup() {
        coordinator.goToCreateGroup()
//        do {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "dd/MM/yyyy"
//            let eventDate = formatter.date(from: "10/08/2021")
//
//            try self.viewModel.addNewFriendGroup(element: FriendGroup(name: "Amigos", friends: [], minimumValue: 200.0, eventDate: eventDate!))
//            self.viewGroup.tableView.reloadData()
//        } catch {
//            let alert = UIAlertController(title: "Ops!", message: "Não foi possível criar o grupo.", preferredStyle: .alert)
//            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
//            alert.addAction(action)
//            self.present(alert, animated: true, completion: nil)
//        }
    }
    
    func deleteFriendGroup(position: Int) {
        do {
            try self.viewModel.deleteFriendGroup(at: position)
            self.viewGroup.tableView.reloadData()
        } catch {
            let alert = UIAlertController(title: "Ops!", message: "Não foi possível deletar o grupo.", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
