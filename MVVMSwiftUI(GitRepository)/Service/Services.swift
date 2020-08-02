//
//  Services.swift
//  MVVMSwiftUI(GitRepository)
//
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


struct ServiceController {
    
    var ServiceShared : ServiceNetworkLayer = {
        let service = ServiceNetworkLayer()
        return service
    }()
    
    enum ApisList{
        case UserProfile
        case UserRepos
        var Request : HTTPRequest {
            switch self {
            case .UserProfile:
                var feedRequest = HTTPRequest()
                feedRequest.method = HTTPMethod.get.rawValue
                feedRequest.path = "/users/hooradramezani"
                feedRequest.scheme = "https"
                feedRequest.host = "api.github.com"
                feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
                return feedRequest
            case .UserRepos:
                var feedRequest = HTTPRequest()
                feedRequest.method = HTTPMethod.get.rawValue
                feedRequest.path = "/users/hooradramezani/repos"
                feedRequest.scheme = "https"
                feedRequest.host = "api.github.com"
                feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
                return feedRequest
            }

        }
    }
    
    func RequestFor(api:ApisList,completion: @escaping (Data?, Error?) -> Void){
        ServiceShared.DataTask(api.Request) { (data, err) in
            completion(data,err)
        }
    }
    // End Of MakeRequestFor Func
    
    
}

