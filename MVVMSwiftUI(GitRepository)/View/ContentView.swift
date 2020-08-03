//
//  ContentView.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var ProfileVM = UserVieModel()
    @State var searchText : String = ""
    
    var body: some View {
        
        NavigationView{
            
            if ProfileVM.isProfileReady {
                ScrollView{
                    VStack(alignment: .leading, spacing: 16){
                        SearchBar(text: $searchText, userVieModel: ProfileVM)
                            .padding(.init(top: 16, leading: 8, bottom: 16, trailing: 8))
                        HStack{
                            UserProfileView(ProfileVM: ProfileVM)
                                .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .animation(.default)
                            Spacer()
                        }
                        if ProfileVM.isReposReady {
                            UserRepositoryView(ProfileVM: ProfileVM)
                                .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .animation(.default)
                            Spacer()
                        }
                    }.navigationBarTitle("Github Account")
                }
            }else{
                AppStateView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .colorScheme(.dark)
    }
}
