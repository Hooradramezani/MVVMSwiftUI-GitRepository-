//
//  ServiceNetworkLayer.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//


import Foundation


struct ServiceNetworkLayer{
    
    var tools : ServiceNetworkTools = {
        let tools = ServiceNetworkTools()
        return tools
    }()
    
}

extension ServiceNetworkLayer : ServiceProtocol {
    
    func DataTask(_ request: HTTPRequest, completion: @escaping (Data?, Error?) -> Void) {
        
        do{
            let TaskRequest = try tools.configureRequestForDataTask(request)
            tools.StartDataTaskWith(TaskRequest) { (data, error) in
                completion(data,error)
            }
        }catch{ completion(nil,HTTPNetworkError.badRequest) }
        
    }
    
}
