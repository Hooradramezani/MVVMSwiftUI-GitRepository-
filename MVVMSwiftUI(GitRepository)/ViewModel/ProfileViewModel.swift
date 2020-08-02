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

class ProfileViewModel : ObservableObject{
    
    var service : ServiceController = ServiceController()
    
    var didChange = PassthroughSubject<Void,Never>()
    
    @Published var User = [UserProfileModel]()
    
    @Published var Repos = [UserRepositoryModel]()
    
    @Published var isDataReady = false
    
    init() {
        loadProfile()
        LoadRepos()
    }
    
    func loadProfile(){
        
        User.append(UserProfileModel(id: 1, login: "Hoorad Ramezani", bio: "My Bio", avatar_url: "", followers: 1, following: 11, twitter_username: "@Sat", name: "", location: "Erc"))
        
        service.RequestFor(api: .UserProfile) { (data, err) in
            if let Data = data {
                self.DecodeAndUpdateProfile(json: Data)
            }else{
                print(err.debugDescription)
            }
        }
    }
    
    func LoadRepos(){
        
        Repos = [(UserRepositoryModel(id: 1, forks_count: 12, stargazers_count: 1, name: "Whos-in-Space", full_name: "name", language: "lang", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", size: 121)),
        (UserRepositoryModel(id: 2, forks_count: 13, stargazers_count: 1, name: "ToDoListZIRO", full_name: "name", language: "lang", description: "desc", size: 122)),
        (UserRepositoryModel(id: 3, forks_count: 14, stargazers_count: 1, name: "Repository 2", full_name: "name", language: "lang", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", size: 123))]
        
        isDataReady = true
        
        service.RequestFor(api: .UserRepos) { (data, err) in
            print(data)
        }
        
        print(Repos)

    }
    
    func DecodeAndUpdateProfile(json: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(UserProfileModel.self, from: json) {
            DispatchQueue.main.async {
                self.User = [jsonPetitions]
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
                    self.isDataReady = true
                }
            }else{
                print("Can Not Decode Repos Data")
            }
        } catch let error as NSError {
            print(error)
        }
    }
        
}

struct ProfileViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
