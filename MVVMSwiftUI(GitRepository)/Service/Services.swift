//
//  Services.swift
//  MVVMSwiftUI(GitRepository)
//
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


struct ServiceController {
    
    // Mark: - Properties
    var ServiceShared : ServiceNetworkLayer = {
        let service = ServiceNetworkLayer()
        return service
    }()
    
    
    // Mark: - Api List 
    enum ApisList{
        case UserProfile(String)
        case UserRepos(String)
        var Request : HTTPRequest {
            switch self {
            case .UserProfile(let User):
                var feedRequest = HTTPRequest()
                feedRequest.method = HTTPMethod.get.rawValue
                feedRequest.path = "/users/\(User)"
                feedRequest.scheme = "https"
                feedRequest.host = "api.github.com"
                feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
                return feedRequest
            case .UserRepos(let User):
                var feedRequest = HTTPRequest()
                feedRequest.method = HTTPMethod.get.rawValue
                feedRequest.path = "/users/\(User)/repos"
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
    
    
}

