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
    
    var userProfile = [UserProfileModel]() {
        didSet{
            didChange.send(self)
        }
    }
    
    var service : ServiceController = ServiceController()
    
        
    
    init() {
        loadData()
    }
    
    func loadData(){
        
        let UserProfile = [UserProfileModel(id: 0, username: "Hoorad", bio: "Some Bio Come Here And Shin Like a Dimond")
        ]
        self.userProfile = UserProfile
        
    }
                
    
}
