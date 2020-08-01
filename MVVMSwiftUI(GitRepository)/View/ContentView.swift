//
//  ContentView.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var ProfileVM = ProfileViewModel()
    
    var body: some View {
        
        NavigationView{
            
            if ProfileVM.isDataReady {
                VStack(alignment: .leading, spacing: 16){
                    UserProfileView()
                        .padding(.init(top: 16, leading: 6, bottom: 16, trailing: 16))
                        .animation(.interactiveSpring())
                    UserRepositoryView()
                        .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .animation(.interactiveSpring())
                }.navigationBarTitle("Github Account")
            }else{
                Text("Loading ...")
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
