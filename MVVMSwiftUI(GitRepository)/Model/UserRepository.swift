//
//  UserRepository.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation
import Combine

struct UserRepositoryModel : Identifiable , Decodable, Hashable, Equatable{
    var id: Int = 0
    var forks_count: Int? = 0
    var stargazers_count : Int? = 0
    var name: String = ""
    var full_name: String? = ""
    var language : String? = ""
    var description :String? = ""
    var size : Int? = 0
}
