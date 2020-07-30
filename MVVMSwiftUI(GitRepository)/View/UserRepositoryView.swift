//
//  UserRepositoryView.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import SwiftUI

struct UserRepositoryView: View {
    
    let contentViewModel : ContentViewModel = ContentViewModel()

    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16){
            // Mark: - User Ropos
            Text("User Ropos").font(.title)
            
                ForEach(contentViewModel.UserRepository,id: \.id){ rep in
                    VStack(alignment: .leading, spacing: 8){
                        Text(rep.name).font(.headline)
                        Text(rep.full_name).font(.subheadline)
                        HStack(){
                            Text("⭐️ 5 Star").font(.body)
                            Text("🛠 2 Fork").font(.body)
                            Text("🟢 Swift").font(.body)                            
                        }
                    }.padding(.bottom ,16)
                }
            
            // end of - User Repos
        }
    }
}

struct UserRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserRepositoryView()
    }
}
