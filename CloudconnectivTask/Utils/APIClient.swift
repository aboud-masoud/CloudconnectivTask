//
//  APIClient.swift
//  CloudconnectivTask
//
//  Created by mac on 3/4/18.
//  Copyright © 2018 OrderEra. All rights reserved.
//

import Foundation
import Alamofire

class APIClient: NSObject {
    
    private static let serverUrl = "https://45.55.43.15:9090/api/"
    
    class var sharedInstance : APIClient {
        struct Static {
            static let instance : APIClient = APIClient()
        }
        return Static.instance
    }
    
    private static var Manager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "https://45.55.43.15:9090": .disableEvaluation
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return manager
    }()
    
        
    class func callGetService(type: RequestType, attrebute: String, callback: @escaping (_ response: Dictionary<String, Any>?, _ error: String?) -> Void) {
        let delegate: Alamofire.SessionDelegate = APIClient.Manager.delegate
        delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = APIClient.Manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }
        
        let numberOfItemInEachPage = 10
        let authUserName = "admin@boot.com"
        let authPassword = "admin"

        APIClient.Manager.request(serverUrl + type.rawValue + "?" + attrebute + "&size=\(numberOfItemInEachPage)").authenticate(user: authUserName, password: authPassword).responseJSON { response in
            switch response.result {
            case .success:
                if let JSON = response.result.value {
                    if let dict: Dictionary<String, Any> = JSON as? Dictionary<String, Any> {
                        callback(dict, "")
                    }
                } else {
                    callback([:], "")
                }
            case .failure(let error):
                print(error.localizedDescription)
                callback([:], "")
            }
        }
    }
}

