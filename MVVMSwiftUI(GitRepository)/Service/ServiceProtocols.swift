//
//  ServiceProtocols.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func DataTask(_ request: HTTPRequest,completion: @escaping(Data?, Error?) -> Void)
}

protocol ServiceToolsProtocol {
    func configureRequestForDataTask(_ HTTPRequest:HTTPRequest) throws -> URLRequest
    func ValidateResponse(_ Response:HTTPURLResponse?,_ data:Data?) throws -> Data
    func StartDataTaskWith(_ request:URLRequest, completion:@escaping(Data?,Error?) -> Void)
    func JSONSerializationWith(_ data:Data, completion:@escaping(Dictionary<String, Any>?,Error?) -> Void)
}

