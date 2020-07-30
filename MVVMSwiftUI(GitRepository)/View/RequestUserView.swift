//
//  RequestUserView.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 7/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import SwiftUI
import Combine

struct RequestUserView: View {
    
    @State var username: String = ""
    

    var body: some View {
        
        VStack(alignment: .center, spacing: 16){
            TextField("Enter you'r github username...", text: $username)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                print("Hello")                
            }){
                Text("Request")
                .font(.headline)
                    .cornerRadius(8)
            }
        }
    }
}

struct RequestUserView_Previews: PreviewProvider {
    static var previews: some View {
        RequestUserView()
    }
}
