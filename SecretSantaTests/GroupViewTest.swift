//
//  GroupViewTest.swift
//  SecretSantaTests
//
//  Created by Camila Luísa on 28/01/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

import XCTest
@testable import SecretSanta

class GroupViewTest: XCTestCase {
    var groupViewModel: GroupViewModel?

    override func setUp() {
        groupViewModel = GroupViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAddNewFriendGroupWithEmptyFriends() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let eventDate = formatter.date(from: "10/08/2021")
        
        let friendGroupOne = SecretSanta.FriendGroup(name: "Amigos", friends: [], minimumValue: 200.0, eventDate: eventDate!)
        
        do {
            try groupViewModel?.addNewFriendGroup(element: friendGroupOne)
        } catch {
            
        }
        
        let lastElement = groupViewModel?.friendsGroups.last?.friends.count
        
        XCTAssertEqual(0, lastElement)
    }
    
    func testAddNewFriendGroupWithEventDateOnThePast() {
        let yesterday = Date(timeIntervalSince1970: 1578614400)
        
        let friendGroupOne = SecretSanta.FriendGroup(name: "Amigos", friends: [], minimumValue: 200.0, eventDate: yesterday)
                
        XCTAssertThrowsError(try groupViewModel?.addNewFriendGroup(element: friendGroupOne), "The addNewFriendGroup() should have thrown an error if group's eventDate contains illigal date") { (errorThrown) in
            XCTAssertEqual(errorThrown as? SecretSanta.GroupViewModel.ProblemWithGroup, SecretSanta.GroupViewModel.ProblemWithGroup.dayHasPassed)
            }
    }
}
