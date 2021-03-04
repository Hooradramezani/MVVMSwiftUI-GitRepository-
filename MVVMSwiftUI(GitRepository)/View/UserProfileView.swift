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
    
    // Mark: - Properties
    var ViewModel : UserVieModel
    @ObservedObject var imageLoader:ImageLoader
    
    // Mark: - init
    init(viewModel:UserVieModel){
        ViewModel = viewModel
        imageLoader = ImageLoader(urlString:ViewModel.User.first?.avatar_url ?? "")
    }

    var body: some View {
                
        VStack(alignment: .leading, spacing: 16){
            
            // Mark: - HeadLine Text
            Text("User Profile")
                .font(.title)
                .foregroundColor(Color.gray)
            
            
            // Mark: - Profile VStack
            VStack(alignment: .leading,spacing: 16){
                
                // Mark: - User Quick Preview HStack
                HStack(alignment: .top){
                    
                    Image(uiImage: imageLoader.dataIsValid ? imageFromData(imageLoader.data!) : UIImage())
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .scaledToFill()
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 8){
                        Text(ViewModel.User.first?.login ?? "")
                            .font(.headline).bold()
                        Text(ViewModel.User.first?.bio ?? "")
                            .font(.subheadline)
                    }
                }.padding(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
                
                
                // Mark: - User Contact information List
                VStack(alignment: .leading, spacing: 8){
                    
                    Text("Contact info")
                        .font(.headline)
                    
                    if ViewModel.User.first?.blog != nil {
                        HStack{
                            Text("📎").font(.subheadline)
                            Text(ViewModel.User.first?.blog ?? "").font(.subheadline)
                        }
                    }
                    HStack{
                        Text("👥").font(.subheadline)
                        Text("\(ViewModel.User.first?.followers ?? 0) Followers • \(ViewModel.User.first?.following ?? 0) Following").font(.subheadline)
                    }
                    
                    if ViewModel.User.first?.email != nil{
                        HStack{
                            Text("✉️").font(.subheadline)
                            Text(ViewModel.User.first?.email ?? "").font(.subheadline)
                        }
                    }
                    
                    if ViewModel.User.first?.company != nil{
                        HStack{
                            Text("🏢").font(.subheadline)
                            Text(ViewModel.User.first?.company ?? "").font(.subheadline)
                        }
                    }
                    
                    if ViewModel.User.first?.location != nil{
                        HStack{
                            Text("📍").font(.subheadline)
                            Text(ViewModel.User.first?.location ?? "").font(.subheadline)
                        }
                    }
                }
                .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
                // - end of User Contact information List
            }
            // - end of Profile VStack
            
        }.frame(alignment:.leading)        
    }
    
    
    
    // Mark: - Return UIImage From Data
    func imageFromData(_ data:Data) -> UIImage {
        UIImage(data: data) ?? UIImage()
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(viewModel: UserVieModel())
    }
}
