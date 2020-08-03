//
//  UserRepositoryView.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import SwiftUI
import Combine

struct UserRepositoryView: View {
    
    
    var ProfileVM : UserVieModel

    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            
            // Mark: - User Repo
            
            Text("User Repository").font(.title)
                .foregroundColor(Color.gray)
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(ProfileVM.Repos,id: \.id){ rep in
                     
                     VStack(alignment: .leading, spacing: 8){
                        Text(rep.name).font(.headline)
                         Text(rep.full_name ?? "").font(.subheadline)
                         HStack(){
                             Text("⭐️ 5 Star").font(.callout)
                             Text("🛠 2 Fork").font(.callout)
                             Text("🟢 Swift").font(.callout)
                            Spacer()
                         }
                        
                        Text(rep.description ?? "").font(.body)
                     }.padding(.init(top: 16, leading: 16, bottom: 24, trailing: 16))
                        .background(Color.white)
                        .foregroundColor(Color.black)
                    .cornerRadius(12)
                 }.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 16))
 
            }
            
        }
    }
}

struct UserRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserRepositoryView(ProfileVM: UserVieModel())
    }
}
