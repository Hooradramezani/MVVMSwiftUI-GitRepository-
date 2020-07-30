//
//  UserRepository.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

struct UserRepositoryModel : Identifiable , Codable{
    var id, forks_count, stargazers_count: Int
    var name, full_name, language : String
    var size : Double
}
