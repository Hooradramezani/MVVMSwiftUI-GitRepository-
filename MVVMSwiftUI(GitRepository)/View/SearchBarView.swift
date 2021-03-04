//
//  SearchBar.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//


import SwiftUI
 
struct SearchBarView: View {
    
    // Mark: Properties
    @Binding var text: String
    @State private var isEditing = false
    var viewModel : UserVieModel

    var body: some View {
        
        // Mark: - SearchBar View
        HStack {
            TextField("Search For User ...", text: $text)
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
                    if self.text != ""{
                        self.isEditing = false
                        self.viewModel.isProfileReady = false
                        self.viewModel.isReposReady = false
                        self.viewModel.isInvalidData = false
                        self.viewModel.LoadData(user: self.text)
                        UIApplication.shared.endEditing()
                    }else{
                        UIApplication.shared.endEditing()
                    }
                }) {
                    Text("Search")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""), viewModel: UserVieModel())
    }
}

// extension for keyboard to dismiss
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
