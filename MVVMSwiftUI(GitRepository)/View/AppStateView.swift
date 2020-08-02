//
//  Loading.swift
//  MVVMSwiftUI(GitRepository)
//
//  Created by Hoorad on 8/1/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import SwiftUI

struct AppStateView: View {
    
    var body: some View {
        Text("Loading Data ...")
            .font(.largeTitle)        
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        AppStateView()
    }
}
