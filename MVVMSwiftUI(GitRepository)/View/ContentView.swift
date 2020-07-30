//
//  ContentView.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let users: [User] = [
        .init(id:0,username: "Hoorad", bio: "Bio Text Here for more line we have more line we can show all bio text here just simple that.")
    ]
    
    var body: some View {
        
        
        
        NavigationView(){
            
            VStack(alignment: .leading, spacing: 16){
                
                // Mark: - User Profile
                Text("User Profile").bold()
                    .font(Font.system(size: 24))
                
                VStack(alignment: .leading, spacing: 16){
                    
                    // Mark: - User Quick info
                    HStack{
                        Image("IMG_0065")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .scaledToFill()
                            .clipShape(Circle())
                        VStack (alignment: .leading, spacing: 8){
                            Text(users.first?.username ?? "").font(.headline)
                            Text(users.first?.bio ?? "").font(.subheadline)
                        }
                    }// end of - User Quick info
                    
                    
                    Text("Contact info").font(.subheadline).bold()
                    
                    // Mark: - User Urls
                    HStack(){
                        Image("Mail_icon").resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFit()
                            .clipped()
                        Text("Hooradramezani@gmail.com").font(.subheadline)
                    }
                    HStack{
                        Image("Mail_icon").resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFit()
                            .clipped()
                        Text("Hooradramezani@gmail.com").font(.subheadline)
                    }
                    HStack{
                        Image("Twitter_icon").resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFit()
                            .clipped()
                        Text("Hooradramezani@gmail.com").font(.subheadline)
                    }
                    // end of - User Urls
                                    
                }
                .padding(.init(top: 8, leading: 0, bottom: 8, trailing: 16))
                //end of - User Profile
                
                // Mark: - User Ropos
                Text("User Ropos").bold()
                    .font(Font.system(size: 24))
                
                // end of - User Repos
            }
            .frame(width: nil)
            .navigationBarTitle(Text("Github Account"))
            .padding()
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
