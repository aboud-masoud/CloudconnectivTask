//
//  SharedFunctions.swift
//  CloudconnectivTask
//
//  Created by mac on 3/4/18.
//  Copyright © 2018 OrderEra. All rights reserved.
//

import UIKit

class SharedFunctions: NSObject {
    
    class func checkInternrtConnection(baseController: UIViewController) -> Bool {
        Reachability().monitorReachabilityChanges()
        switch Reachability().connectionStatus() {
        case .Unknown, .Offline:
            return false
        default:
            return true
        }
    }
    
    class func convertJsonToDataFrom(json: Dictionary<String, Any>) -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            return nil
        }
        return data
    }
}
