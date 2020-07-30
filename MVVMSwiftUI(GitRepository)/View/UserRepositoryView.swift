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
    
    let ContentVM : RepositoryViewModel = RepositoryViewModel()

    var body: some View {
        
        VStack(alignment: .leading, spacing: 16){
            // Mark: - User Ropos
            Text("User Ropository").font(.title)
                .foregroundColor(Color.accentColor)
            ForEach(ContentVM.userRepository,id: \.id){ rep in
                    VStack(alignment: .leading, spacing: 8){
                        Text(rep.name).font(.headline)
                        Text(rep.full_name).font(.subheadline)
                        HStack(){
                            Text("⭐️ 5 Star").font(.callout)
                            Text("🛠 2 Fork").font(.callout)
                            Text("🟢 Swift").font(.callout)
                        }
                    }.padding(.bottom ,16)
            }.padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            // end of - User Repos
        }
    }
}

struct UserRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserRepositoryView()
    }
}
