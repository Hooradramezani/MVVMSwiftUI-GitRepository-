//
//  UserProfileView.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import SwiftUI
import Combine

struct UserProfileView: View {
    
    @ObservedObject var ProfileVM = ProfileViewModel()
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 16.0){
            
            Text("User Profile")
                .font(.title)
                .foregroundColor(Color.gray)
            
            
            VStack(alignment: .leading,spacing: 16.0){
                
                HStack(alignment: .top){
                    Image("IMG_0065").renderingMode(.original)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipped()
                        .scaledToFill()
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text(ProfileVM.userProfile.first?.login ?? "unk")
                            .font(.headline)
                        Text(ProfileVM.userProfile.first?.bio ?? "unk")
                            .font(.subheadline)
                    }
                    
                }.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                
                VStack(alignment: .leading, spacing: 8){
                    
                    Text("Contact info")
                        .font(.headline)
                    HStack{
                        Text("📎").font(.subheadline)
                        Text("https://dribbble.com/hoorad").font(.subheadline)
                    }
                    HStack{
                        Text("👥").font(.subheadline)
                        Text("\(ProfileVM.userProfile.first?.followers ?? 99) Followers • \(ProfileVM.userProfile.first?.following ?? 99) Following").font(.subheadline)
                    }
                    HStack{
                        Text("📍").font(.subheadline)
                        Text(ProfileVM.userProfile.first?.location ?? "Location").font(.subheadline)
                    }
                }
            }.padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
