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
    var login : String? = ""
    var bio : String? = ""
    var avatar_url: String? = ""
    var followers : Int? = 0
    var following : Int? = 0
    var twitter_username : String? = "Not Set"
    var name : String? = ""
    //var email : String = ""
    var location : String? = "Not Set"



}
