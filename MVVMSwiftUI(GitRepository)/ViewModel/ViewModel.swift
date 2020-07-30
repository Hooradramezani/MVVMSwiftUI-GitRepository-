//
//  ViewModel.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

struct ContentViewModel {
    
    var UserProfile : UserProfileModel = UserProfileModel(id: 0, username: "Hoorad", bio: "Some Bio Come Here And Shin Like a Dimond")
    
    let UserRepository : [UserRepositoryModel] = [
        UserRepositoryModel(id: 0, forks_count: 12, stargazers_count: 5, name: "MVVMSwiftUI-GitRepository-", full_name: "Hooradramezani/MVVMSwiftUI-GitRepository-", language: "Swift", size: 569),
        UserRepositoryModel(id: 1, forks_count: 12, stargazers_count: 5, name: "MVVMSwiftUI-GitRepository-", full_name: "Hooradramezani/MVVMSwiftUI-GitRepository-", language: "Swift", size: 569),
        UserRepositoryModel(id: 2, forks_count: 12, stargazers_count: 5, name: "MVVMSwiftUI-GitRepository-", full_name: "Hooradramezani/MVVMSwiftUI-GitRepository-", language: "Swift", size: 569)
    ]
                
    
}
