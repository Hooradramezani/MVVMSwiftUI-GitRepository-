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
                
        VStack(alignment: .leading, spacing: 16){
            
            Text("User Profile")
                .font(.title)
                .foregroundColor(Color.gray)
            
            VStack(alignment: .leading,spacing: 16){
                
                HStack(alignment: .top){
                    Image("IMG_0065").renderingMode(.original)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .scaledToFill()
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 8){
                        Text(ProfileVM.User.first?.login ?? "")
                            .font(.headline).bold()
                        Text(ProfileVM.User.first?.bio ?? "")
                            .font(.subheadline)
                    }
                }.padding(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
                
                VStack(alignment: .leading, spacing: 8){
                    
                    Text("Contact info")
                        .font(.headline)
                    HStack{
                        Text("📎").font(.subheadline)
                        Text("https://dribbble.com/hoorad").font(.subheadline)
                    }
                    HStack{
                        Text("👥").font(.subheadline)
                        Text("\(ProfileVM.User.first?.followers ?? 0) Followers • \(ProfileVM.User.first?.following ?? 0) Following").font(.subheadline)
                    }
                    HStack{
                        Text("📍").font(.subheadline)
                        Text(ProfileVM.User.first?.location ?? "").font(.subheadline)
                    }
                }
                .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
            }
            
        }.frame(alignment:.leading)        
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
