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
            
            // Mark: - User Profile
            Text("User Profile")
                .font(.title)
                .foregroundColor(Color.gray)
            
            VStack(alignment: .leading, spacing: 16){
                
                // Mark: - User Quick info
                HStack(alignment: .top){
                    Image("IMG_0065")
                        .resizable().renderingMode(.original)
                        .frame(width: 80, height: 80)
                        .clipped()
                        .scaledToFill()
                        .clipShape(Circle())
                    VStack (alignment: .leading, spacing: 8){
                        
                        Text(ProfileVM.userProfile.first?.login ?? "FullName")
                            .font(.headline)
                             .lineLimit(4)
                        Text(ProfileVM.userProfile.first?.bio ?? "Bio")
                             .font(.subheadline)
                             .lineLimit(4)
                    }
                }
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                // end of - User Quick info
                
                
                VStack(alignment: .leading, spacing: 8){
                    // Mark: - User Urls
                    
                    Text("Contact info")
                        .font(.subheadline)
                    
                    HStack(){
                        Text("✉️").font(.subheadline)
                        Text(ProfileVM.userProfile.first?.email ?? "").font(.subheadline)
                    }
                    HStack{
                        Text("👥").font(.subheadline)
                        Text("\(ProfileVM.userProfile.first?.followers ?? 99) Followers • \(ProfileVM.userProfile.first?.following ?? 99) Following").font(.subheadline)
                    }
                    HStack{
                        Text("📍").font(.subheadline)
                        Text(ProfileVM.userProfile.first?.location ?? "Location").font(.subheadline)
                    }
                    HStack{
                        Text("Ⓜ️").font(.subheadline)
                        Text("@hoorad_r").font(.subheadline)
                    }
                    HStack{
                        Text("📎").font(.subheadline)
                        Text("https://dribbble.com/hoorad").font(.subheadline)
                    }
                    // end of - User Urls
                }.padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))

                                
            }
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            //end of - User Profile
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
