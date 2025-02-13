//
//  ContentView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 27/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                ThreadsTabView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
