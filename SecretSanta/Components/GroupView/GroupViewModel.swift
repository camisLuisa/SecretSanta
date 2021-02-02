import Foundation
    
final class GroupViewModel {
    
    // MARK: - Attributes
    weak var groupViewController: GroupViewController?
    
    var friendsGroups: [FriendGroup] = [] {
        didSet {
            groupViewController?.viewGroup.instructionsLabel.isHidden = !friendsGroups.isEmpty
        }
    }
    
    @discardableResult 
    func addNewFriendGroup(element: FriendGroup) throws -> [FriendGroup] {
        let today = Date()
        
        if element.eventDate.compare(today) == .orderedAscending {
            throw ProblemWithGroup.dayHasPassed
        }
        
        friendsGroups.append(element)
        
        return friendsGroups
    }
    
    @discardableResult
    func deleteFriendGroup(at position: Int) throws -> [FriendGroup] {
        if position < 0 ||  position >= friendsGroups.count {
            throw ProblemWithGroup.positionNotExist
        }
        
        friendsGroups.remove(at: position)
        
        return friendsGroups
    }
    
    public enum ProblemWithGroup: Error {
        case dayHasPassed
        case positionNotExist
    }
}
