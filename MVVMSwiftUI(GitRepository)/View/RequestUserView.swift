//
//  SearchBar.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//


import SwiftUI
 
struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false
    @ObservedObject var userVieModel = UserVieModel()

    var body: some View {
        HStack {
 
            TextField("Search User ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.userVieModel.isProfileReady = false
                    self.userVieModel.isReposReady = false
                    self.userVieModel.LoadData(user: self.text)
                }) {
                    Text("Search")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
