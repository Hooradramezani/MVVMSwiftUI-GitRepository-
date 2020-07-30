//
//  Services.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
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
            }
        }
    }
    
    func RequestFor(api:ApisList,completion: @escaping ([String : Any]?, Error?) -> Void){
        ServiceShared.DataTask(api.Request) { (data, err) in
            //completion(data,err)
            if let data = data {
                self.ServiceShared.tools.JSONSerializationWith(data) { (json, err) in
                    completion(json,err)
                }
            }
        }
    }
    // End Of MakeRequestFor Func
    
}

