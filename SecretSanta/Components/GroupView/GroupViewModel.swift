final class GroupViewModel {
    
    // MARK: - Attributes
    weak var groupViewController: GroupViewController?
    
    var friendsGroups: [FriendGroup] = [] {
        didSet {
            groupViewController?.viewGroup.instructionsLabel.isHidden = !friendsGroups.isEmpty
        }
    }
}
