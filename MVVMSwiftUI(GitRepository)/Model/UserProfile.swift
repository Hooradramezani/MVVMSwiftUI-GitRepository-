//
//  User.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

struct UserProfileModel : Identifiable , Decodable, Hashable{
    var id: Int
    var username, bio : String
    
    init(id:Int, username:String, bio:String) {
        self.id = id
        self.username = username
        self.bio = bio
    }
}
