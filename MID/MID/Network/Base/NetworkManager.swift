//
//  NetworkManager.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import Foundation
import SystemConfiguration

final class NetworkManager {
    
    static func isNetworkConnected() -> Bool {
        var sockAddress = sockaddr_in()
        sockAddress.sin_len = UInt8(MemoryLayout.size(ofValue: sockAddress))
        sockAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(
            to: &sockAddress,
            { $0.withMemoryRebound(
                to: sockaddr.self,
                capacity: 1)
                { SCNetworkReachabilityCreateWithAddress(nil, $0)
                }
            }
        ) else {
            return false
        }
        
        var flags = SCNetworkReachabilityFlags()
        
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        return (isReachable && !needsConnection)
    }
}
