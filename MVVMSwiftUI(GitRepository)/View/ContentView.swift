//
//  ContentView.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Mark: - Properties
    @ObservedObject var viewModel = UserVieModel()
    @State var searchText : String = ""
    
    var body: some View {
        
        NavigationView{
            
            // Mark: - Check Statement for availbe Profile
            if viewModel.isProfileReady {
                ScrollView{
                    
                    VStack(alignment: .leading, spacing: 16){
                        
                        // Mark: - Search User View
                        SearchBarView(text: $searchText, viewModel: viewModel)
                            .padding(.init(top: 16, leading: 8, bottom: 16, trailing: 8))
                        
                        // Mark: - Profile View
                        HStack{
                            UserProfileView(viewModel: viewModel)
                                .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .animation(.default)
                            Spacer()
                        }
                        
                        // Mark: - Check Statement for availbe Repos
                        if viewModel.isReposReady {
                            // Mark: - Profile View
                            UserRepositoryView(viewModel: viewModel)
                                .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .animation(.default)
                            Spacer()
                        }
                    }.navigationBarTitle("Github Account")
                }
            }else{
                if viewModel.isInvalidData{
                    VStack(spacing:16){
                        Text("Opps We Have Invalid Data")
                        Button(action: {
                            self.viewModel.LoadData(user: "Hooradramezani")
                        }) {
                            Text("Home")
                        }
                    }
                }else{
                    AppStateView(state: .loading)
                }
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
