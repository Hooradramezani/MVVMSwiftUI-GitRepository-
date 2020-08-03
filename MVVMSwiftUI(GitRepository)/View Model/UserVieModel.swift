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

    @Published var Username : String = "hooradramezani"

    init() {
        print("- State : App Start Fetching Data")
        LoadData(user: Username)
    }
    
    
    func LoadData(user:String){
        self.Username = user
        loadProfile()
        LoadRepos()
    }
    
    func loadProfile(){
        
        service.RequestFor(api: .UserProfile(Username)) { (data, err) in
            if let Data = data {
                self.DecodeAndUpdateProfile(data: Data)
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
    
    func DecodeAndUpdateProfile(data: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(UserProfileModel.self, from: data) {
            DispatchQueue.main.async {
                self.User = [jsonPetitions]
                self.isProfileReady = true
            }
        }else{
            print("Can Not Decode Profile Data")
        }
    }
    
    func DecodeAndUpdateRepos(data: Data) {

        do {
            
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