//
//  SecretSantaTests.swift
//  SecretSantaTests
//
//  Created by Camila Luisa Farias de Lima on 06/03/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import Quick
import Nimble
@testable import SecretSanta

class SecretSantaTests: QuickSpec {
    override func spec() {
        
        describe("Interacting with friendGroup element.") {
            context("GIVEN generic group was created before.") {
                let groupViewModel = GroupViewModel()
                var numberOfElements = 0
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                let eventDate = formatter.date(from: "10/08/2021")
                
                let friendGroupOne = SecretSanta.FriendGroup(name: "Amigos", friends: [], minimumValue: 200.0, eventDate: eventDate!)
                
                do {
                    try groupViewModel.addNewFriendGroup(element: friendGroupOne)
                    numberOfElements = groupViewModel.friendsGroups.count
                } catch {
                    
                }
                
                
                context("WHEN generic group was deleted succesfully.") {
                    do {
                        try groupViewModel.deleteFriendGroup(at: 0)
                    } catch {
                        
                    }
                    
                    it("THEN Number of elements needs to reduced.") {
                        expect(groupViewModel.friendsGroups.count).to(equal(numberOfElements-1))                    }
                }
            }
        }
    }
}
