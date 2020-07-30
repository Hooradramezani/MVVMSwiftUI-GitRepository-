//
//  UserRepositoryViewModel.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/31/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//


import Foundation
import Combine
import SwiftUI

class RepositoryViewModel : ObservableObject{
    
    var didChange = PassthroughSubject<RepositoryViewModel,Never>()

    var userRepository = [UserRepositoryModel]() {
        didSet{
            didChange.send(self)
        }
    }
    
    init() {
        loadDataa()
    }
    
    func loadDataa(){
        
        let UserRepo = [UserRepositoryModel(id: 0, forks_count: 12, stargazers_count: 5, name: "MVVMSwiftUI-GitRepository-", full_name: "Hooradramezani/MVVMSwiftUI-GitRepository-", language: "Swift", size: 569),
        UserRepositoryModel(id: 1, forks_count: 12, stargazers_count: 5, name: "MVVMSwiftUI-GitRepository-", full_name: "Hooradramezani/MVVMSwiftUI-GitRepository-", language: "Swift", size: 569),
        UserRepositoryModel(id: 2, forks_count: 12, stargazers_count: 5, name: "MVVMSwiftUI-GitRepository-", full_name: "Hooradramezani/MVVMSwiftUI-GitRepository-", language: "Swift", size: 569)
        ]
        self.userRepository = UserRepo
    }
                
    
}
