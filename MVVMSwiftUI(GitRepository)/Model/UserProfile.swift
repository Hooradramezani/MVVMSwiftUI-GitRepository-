//
//  User.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

struct UserProfileModel : Identifiable , Decodable, Hashable{
    
    var id: Int = 0
    var login : String = ""
    var bio : String = ""
    
    init(id:Int, login:String, bio:String) {
        self.id = id
        self.login = login
        self.bio = bio
    }
}
