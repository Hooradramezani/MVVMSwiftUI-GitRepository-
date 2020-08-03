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
    
    // Mark: - Properties
    var viewModel : UserVieModel

    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            
            // Mark: - User Repo
            Text("User Repository").font(.title)
                .foregroundColor(Color.gray)
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(viewModel.Repos,id: \.id){ rep in
                     
                     VStack(alignment: .leading, spacing: 8){
                        Text(rep.name).font(.headline)
                         Text(rep.full_name ?? "").font(.subheadline)
                        HStack(spacing:16){
                            
                            HStack{
                                Image("Forkicon60")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .leading)
                                    .clipped()
                                    .foregroundColor(.white)
                                Text("\(rep.forks_count ?? 0)")
                                    .font(.callout)
                            }
                            HStack{
                                Image("Staricon52")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .leading)
                                    .clipped()
                                Text("\(rep.stargazers_count ?? 0)")
                                    .font(.callout)
                            }
                            HStack{
                                Image("langicon52")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .leading).clipped()
                                Text(rep.language ?? "unKnown").font(.callout).bold()                                    .foregroundColor(.red)
                            }
                            Spacer()
                         }
                        Text(rep.description ?? "").font(.caption).foregroundColor(Color.gray)
                     }.padding(.init(top: 16, leading: 16, bottom: 32, trailing: 0))
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                 }.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}

struct UserRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserRepositoryView(viewModel: UserVieModel())
    }
}
