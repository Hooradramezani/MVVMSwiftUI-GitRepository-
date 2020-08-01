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
    
    var didChange = PassthroughSubject<ProfileViewModel,Never>()
    
    @Published var userProfile = [UserProfileModel]() {
        didSet{
            didChange.send(self)
        }
    }
    
    @Published var userRepository = [UserRepositoryModel]() {
        didSet{
            didChange.send(self)
        }
    }
    
    @Published var isDataReady = false {
        didSet{
            didChange.send(self)
        }
    }
    
    var service : ServiceController = ServiceController()
    
    
    init() {
        loadData()
    }
    
    func loadData(){
        service.RequestFor(api: .UserProfile) { (data, err) in
            if let Data = data {
                self.DecodeAndUpdateData(json: Data)
            }else{
                print(err.debugDescription)
            }
        }
    }
    
    func DecodeAndUpdateData(json: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(UserProfileModel.self, from: json) {
            DispatchQueue.main.async {
                self.userProfile = [jsonPetitions]
                self.isDataReady = true
            }
        }else{
            print("Can Not Decode Profile Data")
        }
    }
        
}

struct ProfileViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
