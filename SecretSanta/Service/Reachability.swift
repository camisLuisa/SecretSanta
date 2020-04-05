//
//  Reachability.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 05/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation
import SystemConfiguration

protocol ReachabilityProtocol {
    func isConnectedToNetwork() -> Bool
}

final class Reachability: ReachabilityProtocol {
    func isConnectedToNetwork() -> Bool {
        var zeroAdress = sockaddr()
        zeroAdress.sa_len = UInt8(MemoryLayout<sockaddr>.size)
        zeroAdress.sa_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafeBytes(of: &zeroAdress, SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))) else {
            <#statements#>
        }
    }
    

}
