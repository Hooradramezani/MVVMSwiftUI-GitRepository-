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
    
//    func RequestProfileFor(UserName:String,completion: @escaping (Data?, Error?) -> Void){
//        let req = RequestProfileForUsername(user: UserName)
//        ServiceShared.DataTask(req) { (data, err) in
//            completion(data,err)
//        }
//    }
//
//    func RequestReposFor(UserName:String,completion: @escaping (Data?, Error?) -> Void){
//        let req = RequestReposForUsername(user: UserName)
//        ServiceShared.DataTask(req) { (data, err) in
//            completion(data,err)
//        }
//    }
    // End Of MakeRequestFor Func
    
//    func RequestProfileForUsername(user:String) -> HTTPRequest {
//        var feedRequest = HTTPRequest()
//        feedRequest.method = HTTPMethod.get.rawValue
//        feedRequest.path = "/users/\(Username)/repos"
//        feedRequest.scheme = "https"
//        feedRequest.host = "api.github.com"
//        feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
//        return feedRequest
//    }
//    func RequestReposForUsername(user:String) -> HTTPRequest {
//        var feedRequest = HTTPRequest()
//        feedRequest.method = HTTPMethod.get.rawValue
//        feedRequest.path = "/users/\(Username)/repos"
//        feedRequest.scheme = "https"
//        feedRequest.host = "api.github.com"
//        feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
//        return feedRequest
//    }
    
}

