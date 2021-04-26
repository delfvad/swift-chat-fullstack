//
//  ContentView.swift
//  SwiftUIChatClient
//
//  Created by Vadim Zahariev on 26.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var userInfo = UserInfo()
    
    var body: some View {
        NavigationView {
            SettingsScreen()
        }
        .environmentObject(userInfo)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
