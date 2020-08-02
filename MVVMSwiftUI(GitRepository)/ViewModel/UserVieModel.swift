//
//  ViewModel.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class UserVieModel : ObservableObject{
    
    var service : ServiceController = ServiceController()
    
    var didChange = PassthroughSubject<Void,Never>()
    
    @Published var User = [UserProfileModel]()
    @Published var Repos = [UserRepositoryModel]()
    @Published var isProfileReady = false
    @Published var isReposReady = false

    @Published var Username = "mohamedebrahim96"

    init() {
        LoadData(user: Username)
    }
    
    
    func LoadData(user:String){
        self.Username = user
        loadProfile()
        LoadRepos()
    }
    
    func loadProfile(){
        
//        User.append(UserProfileModel(id: 1, login: "Hoorad Ramezani", bio: "My Bio", avatar_url: "", followers: 1, following: 11, twitter_username: "@Sat", name: "", location: "Erc"))
        
        service.RequestFor(api: .UserProfile(Username)) { (data, err) in
            if let Data = data {
                self.DecodeAndUpdateProfile(json: Data)
            }else{
                print(err.debugDescription)
            }
        }
    }
    
    func LoadRepos(){
                
        service.RequestFor(api: .UserRepos(Username)) { (data, err) in
            if let data = data {
                self.DecodeAndUpdateRepos(data: data)
            }
        }
        
    }
    
    func DecodeAndUpdateProfile(json: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(UserProfileModel.self, from: json) {
            DispatchQueue.main.async {
                self.User = [jsonPetitions]
                print(self.User)
                self.isProfileReady = true
            }
        }else{
            print("Can Not Decode Profile Data")
        }
    }
    
    func DecodeAndUpdateRepos(data: Data) {

        do {
            // make sure this JSON is in the format we expect
            let decoder = JSONDecoder()
            if let jsonPetitions = try? decoder.decode([UserRepositoryModel].self, from: data) {
                DispatchQueue.main.async {
                    self.Repos = jsonPetitions
                    self.isReposReady = true
                }
            }else{
                print("Can Not Decode Repos Data")
            }
        }
    }
        
}
